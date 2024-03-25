## ---- derive-age-cat

derive_age_cat <- function(data, input, output){
  
  if(sum(is.na(data[[input]])) > 0){
    
    stop("Please remove individuals with missing age information or 
         impute these values before making this derivation")
    
  }
  
  else{
    
    data[[output]] <- as.factor(ifelse(
      data[[input]] <= 50, 1, ifelse(
        data[[input]] > 50 & data[[input]] <= 60, 2, ifelse(
          data[[input]] > 60 & data[[input]] <= 70, 3, 4
        ) 
      )
    ))
    
    return(data)
    
  }
  
}

## ---- derive-edu-cat

derive_edu_cat <- function(data, input, output){
  
  if(sum(is.na(data[[input]])) > 0){
    
    stop("Please remove individuals with missing education information or 
         impute these values before making this derivation")
    
  }
  
  else{
    
    data[[output]] <- as.factor(ifelse(
      data[[input]] %in% c(1, 2), 1, ifelse(
        data[[input]] %in% c(3, 4, 7), 2, 3
      ) 
    ))
    
    return(data)    
    
  }
  
  
}

## ---- create-synthetic-data

create_follow_up <- function(input){
  
  synthesis <- syn(input, k = 113)
  
  data <- synthesis$syn
  
  self_care_change <- 
    na.omit(data$selfcare_t1/data$selfcare_t0)
  
  # self_efficacy_change <- 
  #   na.omit(data$self_efficacy_t1/data$self_efficacy_t0)
  # 
  # sitting_change <- 
  #   na.omit(data$ipaq_sit_t1/data$ipaq_sit_t0)
  # 
  # walking_change <-
  #   na.omit(data$ipaq_walking_t1/data$ipaq_walking_t0)
  # 
  # mod_activity_change <-
  #   na.omit(data$ipaq_moderate_t1/data$ipaq_moderate_t0)
  # 
  # vig_activity_change <-
  #   na.omit(data$ipaq_vigorous_t1/data$ipaq_vigorous_t0)
  
  total_physical_activity_change <- 
    na.omit(data$physical_activity_t1/data$physical_activity_t0)
  
  data$self_care_rate_change <- 
    sample(self_care_change[!is.infinite(self_care_change) & 
                              self_care_change != 0], 
           size = nrow(data), replace = TRUE)
  
  # data$self_efficacy_rate_change <- 
  #   sample(self_efficacy_change[!is.infinite(self_efficacy_change) & 
  #                                 self_efficacy_change != 0], 
  #          size = nrow(data), replace = TRUE)
  # 
  # data$sitting_rate_change <- 
  #   sample(sitting_change[!is.infinite(sitting_change) & 
  #                           sitting_change != 0], 
  #          size = nrow(data), replace = TRUE)
  # 
  # data$walking_rate_change <- 
  #   sample(walking_change[!is.infinite(walking_change) & 
  #                           walking_change != 0], 
  #          size = nrow(data), replace = TRUE)
  # 
  # data$mod_activity_rate_change <- 
  #   sample(mod_activity_change[!is.infinite(mod_activity_change) & 
  #                                mod_activity_change != 0], 
  #          size = nrow(data), replace = TRUE)
  # 
  # data$vig_activity_rate_change <- 
  #   sample(vig_activity_change[!is.infinite(vig_activity_change)  & 
  #                                vig_activity_change != 0], 
  #          size = nrow(data), replace = TRUE)
  
  data$total_physical_activity_rate_change <- 
    sample(total_physical_activity_change[!is.infinite(total_physical_activity_change)  & 
                                            total_physical_activity_change != 0], 
           size = nrow(data), replace = TRUE)
  
  return(data)
  
}

## ---- select-cases-to-ampute
select_missing <- function(input, n){
  
  id <- c(1:nrow(input))
  
  drop_out_t1 <- sample(id, n)
  
  id_remaining <- id[-drop_out_t1]
  
  drop_out_t2 <- sample(id_remaining, n)
  
  input$unique_id <- id
  
  input$drop_out_t1 <- ifelse(input$unique_id %in% drop_out_t1, 1, 0)
  
  input$drop_out_t2 <- ifelse(input$unique_id %in% drop_out_t2, 1, 0)
  
  output <- input[, c("unique_id", 
                      "drop_out_t1", 
                      "drop_out_t2",
                      colnames(input))]
  
  return(output)
  
}

## ---- ampute-single-var
create_missing_var <- function(var, input){
  
  t1_only <- input$drop_out_t1
  
  t2 <- c(input$drop_out_t1, input$drop_out_t2)
  
  input[[paste0(var, "_t1")]] <- 
    ifelse(input$drop_out_t1 == 1, 
           NA, 
           input[[paste0(var, "_t1")]])
  
  input[[paste0(var, "_t2")]] <- 
    ifelse(input$drop_out_t2 == 1 | input$drop_out_t1 == 1, 
           NA, 
           input[[paste0(var, "_t2")]])
  
  output <- input[, c("unique_id", 
                      paste0(var, "_t0"),
                      paste0(var, "_t1"), 
                      paste0(var, "_t2"))]
  
  return(output)
  
}

## ---- simulate-missing-dataset
simulate_missing <- function(input, n, var_list){
  
  prep_data <- select_missing(input = input, 
                              n = n)
  
  missing_data <- lapply(var_list, create_missing_var, prep_data)
  
  my_merge <- function(df1, df2){
    merge(df1, df2, by = "unique_id")
  }
  
  basic_data <- prep_data[, c("unique_id", 
                              "randomisation", 
                              "sex", 
                              "age_cat",
                              "education_cat", 
                              "hypertension", 
                              "heart_disease", 
                              "heart_failure")]
  
  missing_data[[5]] <- basic_data
  
  output <- Reduce(my_merge, missing_data)
  
  output <- output[, c("unique_id", 
                       colnames(input))]
  
  return(output)
  
}

## ---- impute-locf-single-var
impute_locf <- function(var, data){
  
  data[[paste0(var, "_t1")]] <- ifelse(is.na(data[[paste0(var, "_t1")]]), 
                                       data[[paste0(var, "_t0")]], data[[paste0(var, "_t1")]])
  
  data[[paste0(var, "_t2")]] <- ifelse(is.na(data[[paste0(var, "_t2")]]), 
                                       data[[paste0(var, "_t1")]], data[[paste0(var, "_t2")]])
  
  data <- data[, c("unique_id", 
                   colnames(data)[grepl(paste(var, collapse = "|"), 
                                        names(data))])]
  
  return(data)
  
}

## ---- impute-locf-dataset
impute_locf_dataset <- function(data, var_list){
  
  imputed_data <- lapply(var_list, impute_locf, data)
  
  my_merge <- function(df1, df2){
    merge(df1, df2, by = "unique_id")
  }
  
  basic_data <- data[, c("unique_id", 
                         "randomisation", 
                         "sex", 
                         "age_cat",
                         "education_cat", 
                         "hypertension", 
                         "heart_disease", 
                         "heart_failure")]
  
  imputed_data[[5]] <- basic_data
  
  output <- Reduce(my_merge, imputed_data)
  
  output <- output[, c("unique_id", 
                       colnames(data))]
  
  return(output)
  
}


