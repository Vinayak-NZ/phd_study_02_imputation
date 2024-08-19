## ---- modelling-LWD

prep_lwd_data <- function(data, var){
  
  input_variables <- 
    colnames(data)[grepl(var, names(data))]
  
  subset_data <- data[, c("unique_id", 
                                "randomisation", 
                                "age_cat", 
                                "sex", 
                                "education_cat", 
                                input_variables)]
  
  subset_data <- subset_data[complete.cases(subset_data), ]
  
  return(subset_data)
  
}

prepare_lwd_long <- function(data, var){
  
  setDT(data)
  
  lwd_long_data <- melt(data, 
                         id.vars = c("unique_id", 
                                     "randomisation", 
                                     "age_cat", 
                                     "sex", 
                                     "education_cat"), 
                         variable.name = "time", 
                         value.name = var)
  
  lwd_long_data[, "time"] <- ifelse(lwd_long_data[, "time"] == paste0(var, "_t0"), 
                                     "baseline", 
                                     ifelse(lwd_long_data[, "time"] == paste0(var, "_t1"), 
                                            "week-12", 
                                            "week-24"))
  
  return(lwd_long_data)
  
}

build_lwd_model <- function(data, var){
  
  if(var == "selfcare"){
    
    lwd_model <- lmer(selfcare ~ randomisation + time + randomisation*time + 
                         age_cat + sex + 
                         education_cat + (1|unique_id), 
                       data = data, 
                       REML = F)
    
  }else if(var == "physical_activity"){
    
    lwd_model <- lmer(physical_activity ~ randomisation + time + randomisation*time + 
                         age_cat + sex + 
                         education_cat + (1|unique_id), 
                       data = data, 
                       REML = F)
    
  }
  
  lwd_model_summary <- summary(lwd_model)
  
  lwd_treatment_effect <- lwd_model_summary$coefficients[2]
  
  lwd_confint <- confint(lwd_model)
  
  return(list(lwd_model_summary, lwd_confint, lwd_treatment_effect))
  
}

apply_lwd_model <- function(data, var){
  
  prepare_var <- prep_lwd_data(data = data, 
                                     var = var)
  
  long_data <- prepare_lwd_long(data = prepare_var, 
                                 var = var)
  
  lwd_model <- build_lwd_model(data = long_data, 
                                 var = var)
  
  return(lwd_model)
  
}

model_lwd_bulk <- function(input, var){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    lwd_model <- apply_lwd_model(data = input[[sim]], 
                                   var = var)
    
    output[[paste(sim)]] <- lwd_model
    
  }
  
  return(output)
  
}

## ---- example-execution

lwd_model_mcar_20 <- model_lwd_bulk(input = results_mcar_20, 
                                      var = "selfcare")
