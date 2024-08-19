## ---- MICE-modelling

# self-care
prepare_mice_output <- function(mi_object, var, uprange){
  
  miceImps <- list()
  
  for (i in 1:mi_object$m){
    
    miceImps[[i]] <- complete(mi_object, i)
    
    miceImps[[i]][[paste0(var, "_t1")]]  <- 
      ifelse(miceImps[[i]][[paste0(var, "_t1")]] < uprange, 
             miceImps[[i]][[paste0(var, "_t1")]], 
             uprange)
    
    miceImps[[i]][[paste0(var, "_t2")]]  <- 
      ifelse(miceImps[[i]][[paste0(var, "_t2")]] < uprange, 
             miceImps[[i]][[paste0(var, "_t2")]], 
             uprange)
    
  }
  
  return(miceImps)
  
}

prepare_mice_long <- function(miceImps, var){
  
  for (i in 1:length(miceImps)){
    
    miceImps[[i]] <- miceImps[[i]][, c("unique_id", 
                                       "randomisation", 
                                       "age_cat", 
                                       "sex", 
                                       "education_cat", 
                                       paste0(var, "_t0"), 
                                       paste0(var, "_t1"), 
                                       paste0(var, "_t2"))]
    
    setDT(miceImps[[i]])
    
    miceImps[[i]] <- melt(miceImps[[i]], 
                          id.vars = c("unique_id", 
                                      "randomisation", 
                                      "age_cat", 
                                      "sex", 
                                      "education_cat"), 
                          variable.name = "time", 
                          value.name = var)
    
    miceImps[[i]][, "time"] <- ifelse(miceImps[[i]][, "time"] == paste0(var, "_t0"), 
                                      "baseline", 
                                      ifelse(miceImps[[i]][, "time"] == paste0(var, "_t1"), 
                                             "week-12", 
                                             "week-24"))
    
    miceImps[[i]]$time <- as.factor(miceImps[[i]]$time)
    
    miceImps[[i]][[var]] <- abs(as.numeric(miceImps[[i]][[var]]))
    
    miceImps[[i]] <- as.data.frame(miceImps[[i]])
    
  }
  
  return(miceImps)
  
}

pool_mice_model <- function(miceImps, var){
  
  if(var == "selfcare"){
    
    formula <- selfcare ~ randomisation + time + randomisation*time + 
      age_cat + sex + 
      education_cat + (1|unique_id)
    
  }else if(var == "physical_activity"){
    
    formula <- physical_activity ~ randomisation + time + randomisation*time + 
      age_cat + sex + 
      education_cat + (1|unique_id)
    
  }
  
  mice_models <- list()
  
  mice_models_summary <- list()
  
  M <- length(miceImps)
  
  for (mm in 1:M){
    
    mice_models[[mm]] <- lme4::lmer(formula, data = miceImps[[mm]], REML=FALSE)
    
    mice_models_summary[[mm]] <- summary(mice_models[[mm]])$coefficients[2]
    
  }
  
  mice_pooled_results <- lmer_pool(mice_models, level = .95)
  
  mice_pooled_output <- summary(mice_pooled_results)
  
  mice_treatment_effect <- unlist(mice_models_summary, use.names=FALSE)
  
  return(list(mice_pooled_results, mice_pooled_output, mice_treatment_effect))
  
}

apply_mice_model <- function(mi_object, var, uprange){
  
  prepare_var <- prepare_mice_output(mi_object = mi_object, 
                                     var = var, 
                                     uprange = uprange)
  
  long_data <- prepare_mice_long(miceImps = prepare_var, 
                                 var = var)
  
  pool_mice_model <- pool_mice_model(miceImps = long_data, 
                                     var = var)
  
  return(pool_mice_model)
  
}

model_mice_bulk <- function(input, var, uprange){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    mice_model <- apply_mice_model(mi_object = input[[sim]], 
                                     var = var, 
                                     uprange = uprange)
    
    output[[paste(sim)]] <- mice_model
    
  }
  
  return(output)
  
}

## ---- example-execution

mice_model_mcar_20 <- model_mice_bulk(input = mice_results_mcar_20, 
                                   var = "selfcare", 
                                   uprange = 100)

