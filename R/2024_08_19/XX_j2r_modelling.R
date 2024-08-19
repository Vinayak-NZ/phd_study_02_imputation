## ---- J2R-modelling

# self-care
mi_object = test0
var = "selfcare"
uprange = 100

prepare_j2r_output <- function(mi_object, var, uprange){
  
  j2rImps <- list()
  
  for (i in 1:length(mi_object)){
    
    j2rImps[[i]] <- mi_object[[i]]
    
    j2rImps[[i]][[paste0(var, "_t1")]]  <- 
      ifelse(j2rImps[[i]][[paste0(var, "_t1")]] < uprange, 
             j2rImps[[i]][[paste0(var, "_t1")]], 
             uprange)
    
    j2rImps[[i]][[paste0(var, "_t2")]]  <- 
      ifelse(j2rImps[[i]][[paste0(var, "_t2")]] < uprange, 
             j2rImps[[i]][[paste0(var, "_t2")]], 
             uprange)
    
  }
  
  return(j2rImps)
  
}

prepare_j2r_long <- function(j2rImps, var){
  
  for (i in 1:length(j2rImps)){
    
    j2rImps[[i]] <- j2rImps[[i]][, c("unique_id", 
                                       "randomisation", 
                                       "age_cat", 
                                       "sex", 
                                       "education_cat", 
                                       paste0(var, "_t0"), 
                                       paste0(var, "_t1"), 
                                       paste0(var, "_t2"))]
    
    setDT(j2rImps[[i]])
    
    j2rImps[[i]] <- melt(j2rImps[[i]], 
                          id.vars = c("unique_id", 
                                      "randomisation", 
                                      "age_cat", 
                                      "sex", 
                                      "education_cat"), 
                          variable.name = "time", 
                          value.name = var)
    
    j2rImps[[i]][, "time"] <- ifelse(j2rImps[[i]][, "time"] == paste0(var, "_t0"), 
                                      "baseline", 
                                      ifelse(j2rImps[[i]][, "time"] == paste0(var, "_t1"), 
                                             "week-12", 
                                             "week-24"))
    
    j2rImps[[i]]$time <- as.factor(j2rImps[[i]]$time)
    
    j2rImps[[i]][[var]] <- abs(as.numeric(j2rImps[[i]][[var]]))
    
    j2rImps[[i]] <- as.data.frame(j2rImps[[i]])
    
  }
  
  return(j2rImps)
  
}

pool_j2r_model <- function(j2rImps, var){
  
  if(var == "selfcare"){
    
    formula <- selfcare ~ randomisation + time + randomisation*time + 
      age_cat + sex + 
      education_cat + (1|unique_id)
    
  }else if(var == "physical_activity"){
    
    formula <- physical_activity ~ randomisation + time + randomisation*time + 
      age_cat + sex + 
      education_cat + (1|unique_id)
    
  }
  
  j2r_models <- list()
  
  j2r_models_summary <- list()
  
  M <- length(j2rImps)
  
  for (mm in 1:M){
    
    j2r_models[[mm]] <- lme4::lmer(formula, data = j2rImps[[mm]], REML=FALSE)
    
    j2r_models_summary[[mm]] <- summary(j2r_models[[mm]])$coefficients[2]
    
  }
  
  j2r_pooled_results <- lmer_pool(j2r_models, level = .95)
  
  j2r_pooled_output <- summary(j2r_pooled_results)
  
  j2r_treatment_effect <- unlist(j2r_models_summary, use.names=FALSE)
  
  return(list(j2r_pooled_results, j2r_pooled_output, j2r_treatment_effect))
  
}

apply_j2r_model <- function(mi_object, var, uprange){
  
  prepare_var <- prepare_j2r_output(mi_object = mi_object, 
                                     var = var, 
                                     uprange = uprange)
  
  long_data <- prepare_j2r_long(j2rImps = prepare_var, 
                                 var = var)
  
  pool_j2r_model <- pool_j2r_model(j2rImps = long_data, 
                                     var = var)
  
  return(pool_j2r_model)
  
}

model_j2r_bulk <- function(input, var, uprange){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    j2r_model <- apply_j2r_model(mi_object = input[[sim]], 
                                   var = var, 
                                   uprange = uprange)
    
    output[[paste(sim)]] <- j2r_model
    
  }
  
  return(output)
  
}

## ---- example-execution

j2r_model_mcar_20 <- model_j2r_bulk(input = j2r_results_mcar_20, 
                                      var = "selfcare", 
                                      uprange = 100)
