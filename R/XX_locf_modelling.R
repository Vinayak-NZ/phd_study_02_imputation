## ---- modelling-LOCF

prepare_locf_output <- function(imp_object, var){
  
  input_variables <- 
    colnames(imp_object)[grepl(var, names(imp_object))]
  
  subset_data <- imp_object[, c("unique_id", 
                               "randomisation", 
                               "age_cat", 
                               "sex", 
                               "education_cat", 
                               input_variables)]
  
  subset_data <- subset_data[complete.cases(subset_data), ]
  
  return(subset_data)
  
}

prepare_locf_long <- function(imp_object, var){
  
  setDT(imp_object)
  
  locf_long_data <- melt(imp_object, 
                    id.vars = c("unique_id", 
                                "randomisation", 
                                "age_cat", 
                                "sex", 
                                "education_cat"), 
                    variable.name = "time", 
                    value.name = var)
  
  locf_long_data[, "time"] <- ifelse(locf_long_data[, "time"] == paste0(var, "_t0"), 
                                "baseline", 
                                ifelse(locf_long_data[, "time"] == paste0(var, "_t1"), 
                                       "week-12", 
                                       "week-24"))
  
  return(locf_long_data)
  
}

build_locf_model <- function(imp_object, var){
  
  if(var == "selfcare"){
    
    locf_model <- lmer(selfcare ~ randomisation + time + randomisation*time + 
                         age_cat + sex + 
                         education_cat + (1|unique_id), 
                       data = imp_object, 
                       REML = F)
    
  }else if(var == "physical_activity"){
    
    locf_model <- lmer(physical_activity ~ randomisation + time + randomisation*time + 
                         age_cat + sex + 
                         education_cat + (1|unique_id), 
                       data = imp_object, 
                       REML = F)
    
  }
  
  locf_model_summary <- summary(locf_model)
  
  locf_treatment_effect <- locf_model_summary$coefficients[2]
  
  locf_confint <- confint(locf_model)
  
  return(list(locf_model_summary, locf_confint, locf_treatment_effect))
  
}

apply_locf_model <- function(imp_object, var){
  
  prepare_var <- prepare_locf_output(imp_object = imp_object, 
                                    var = var)
  
  long_data <- prepare_locf_long(imp_object = prepare_var, 
                                var = var)
  
  locf_model <- build_locf_model(imp_object = long_data, 
                                    var = var)
  
  return(locf_model)
  
}

model_locf_bulk <- function(input, var){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    locf_model <- apply_locf_model(imp_object = input[[sim]], 
                                 var = var)
    
    output[[paste(sim)]] <- locf_model
    
  }
  
  return(output)
  
}

## ---- example-execution

locf_model_mcar_20 <- model_locf_bulk(input = locf_results_mcar_20, 
                                    var = "selfcare")
