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
  
  total_physical_activity_change <- 
    na.omit(data$physical_activity_t1/data$physical_activity_t0)
  
  data$self_care_rate_change <- 
    sample(self_care_change[!is.infinite(self_care_change) & 
                              self_care_change != 0], 
           size = nrow(data), replace = TRUE)
  
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
  
  missing_data[[3]] <- basic_data
  
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
  
  imputed_data[[3]] <- basic_data
  
  output <- Reduce(my_merge, imputed_data)
  
  output <- output[, c("unique_id", 
                       colnames(data))]
  
  return(output)
  
}

## ---- evaluate-unit-record-data
evaluate_unit_record_rmse <- function(observed_data, predicted_data, observed_var, predicted_var){
  
  observed_data[["unique_id"]] <- c(1:226)
  
  predicted_data <- predicted_data[, c("unique_id", predicted_var)]
  
  names(predicted_data)[names(predicted_data) == predicted_var] <- "predicted"
  
  observed_data <- observed_data[, c("unique_id", observed_var)]
  
  names(observed_data)[names(observed_data) == observed_var] <- "observed"
  
  data_eval <- merge(predicted_data, observed_data, by = "unique_id")
  
  data_eval$difference <- (data_eval$predicted - data_eval$observed)^2
  
  rmse <- sqrt(sum(data_eval$difference, na.rm = TRUE)/nrow(data_eval))
  
  return(rmse)
  
}
