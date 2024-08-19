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

## ---- simulate-missing-t1

simulate_missing_t1 <- function(data, var, proportion, miss_mech){
  
  data$unique_id <- 1:nrow(data)
  
  data_subset_t1 <- data[, c("unique_id", 
                             "randomisation", 
                             "sex", 
                             "age_cat", 
                             "education_cat", 
                             "hypertension", 
                             "heart_disease", 
                             "heart_failure", 
                             paste0(var, "_t0"), 
                             paste0(var, "_t1"))]
  
  patterns <- matrix(c(rep(1, 9), 0), 
                     nrow = 1, 
                     byrow = TRUE)
  
  data_subset_t1_missing <- mice::ampute(data_subset_t1, 
                                         prop = proportion, 
                                         patterns = patterns, 
                                         mech = miss_mech)
  
  data_subset_t1_missing_output <- 
    data_subset_t1_missing$amp
  
  data_t1_missing_only <- 
    data_subset_t1_missing_output[is.na(data_subset_t1_missing_output[[paste0(var, "_t1")]]), ]
  
  data_t1_missing_only[[paste0(var, "_t2")]] <- NA
  
  return(list(data_subset_t1_missing_output, data_t1_missing_only, data))
  
}

## ---- prepare-missing-t2

create_t2_input <- function(data, var, data_subset_t1_missing_output){
  
  data_t1_complete <- 
    data_subset_t1_missing_output[complete.cases(data_subset_t1_missing_output), ]
  
  data_t1_complete_id <- data_t1_complete[, "unique_id"]
  
  data_t2 <- data[data$unique_id %in% data_t1_complete_id, 
                  c("unique_id", 
                    "randomisation", 
                    "sex", 
                    "age_cat", 
                    "education_cat", 
                    "hypertension", 
                    "heart_disease", 
                    "heart_failure", 
                    "selfcare_t0", 
                    paste0(var, "_t2"))]
  
  return(list(data_t1_complete, data_t2))
  
}

## ---- simulate-missing-t2

simulate_missing_t2 <- function(data_t2_subset, var, proportion, miss_mech){
  
  patterns <- matrix(c(rep(1, 9), 0), 
                     nrow = 1, 
                     byrow = TRUE)
  
  data_subset_t2_missing <- mice::ampute(data_t2_subset, 
                                         prop = proportion, 
                                         patterns = patterns, 
                                         mech = miss_mech)
  
  data_subset_t2_missing_output <- 
    data_subset_t2_missing$amp[, c("unique_id", paste0(var, "_t2"))]
  
  return(data_subset_t2_missing_output)
  
}

## ---- simulate-missingness-t1-t2

combine_simulations <- function(data_t1_missing, data_t1_complete, data_t2){
  
  data_t2_t1_merge <- merge(data_t1_complete, data_t2, by = "unique_id")
  
  simulation_output <- rbind(data_t1_missing, data_t2_t1_merge)
  
  simulation_output <- simulation_output[order(simulation_output$unique_id), ]
  
  return(simulation_output)
  
}

## ---- simulate-missingness-pipeline

simulate_missingness <- function(data, var, proportion, miss_mech){
  
  t1_output <- simulate_missing_t1(data = data, 
                                   var = var, 
                                   proportion = proportion, 
                                   miss_mech = miss_mech)
  
  t2_input <- create_t2_input(data = t1_output[[3]], 
                              var = var, 
                              data_subset_t1_missing_output = t1_output[[1]])
  
  t2_output <- simulate_missing_t2(data_t2_subset = t2_input[[2]], 
                                   var = var, 
                                   proportion = proportion, 
                                   miss_mech = miss_mech)
  
  simulation_output <- combine_simulations(data_t1_missing = t1_output[[2]], 
                                           data_t1_complete = t2_input[[1]], 
                                           data_t2 = t2_output)
  
  return(simulation_output)
  
}

## ---- simulate-missingness-multiple

simulate_missingness_bulk <-function(data, var, proportion, miss_mech, iterations){
  
  output <- list()
  
  for (sim in 1:iterations) {
    
    simulation <- simulate_missingness(data = data, 
                                       var = var, 
                                       proportion = proportion, 
                                       miss_mech = miss_mech)
    
    output[[paste(sim)]] <- simulation
  }
  
  return(output)
  
}

## ---- create-mice-input

create_mice_input <- function(data, var){
  
  input_variables <- 
    colnames(data)[grepl(var, names(data))]
  
  
  data_to_impute <-
    data[, names(data) %in% c("unique_id", 
                              "randomisation", 
                              "sex", 
                              "age_cat", 
                              "education_cat", 
                              "hypertension", 
                              "heart_disease", 
                              "heart_failure",
                              input_variables)]
  
  
  predictor_matrix <- mice::make.predictorMatrix(data_to_impute)
  
  predictor_matrix[, c("unique_id")] <- 0
  
  return(list(data_to_impute, predictor_matrix))
  
}

## ---- apply-mice

apply_mice <- function(data_to_impute, predictor_matrix, iterations){
  
  mi_object <- mice(
    data_to_impute,
    m = iterations,
    maxit = 50,
    predictorMatrix = predictor_matrix,
    seed = 500
  )
  
  return(mi_object)
  
}

## ---- simulate-mice

simulate_mice <- function(data, var, iterations){
  
  mice_input <- create_mice_input(data = data, 
                                  var = var)
  
  
  mice_output <- apply_mice(data_to_impute = mice_input[[1]], 
                            predictor_matrix = mice_input[[2]], 
                            iterations = iterations)
  
  return(mice_output)
  
}

## ---- simulate-mice-bulk

simulate_mice_bulk <- function(input, var, imp_iterations){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    mice_simulation <- simulate_mice(data = input[[sim]], 
                                     var = var, 
                                     iterations = imp_iterations)
    
    output[[paste(sim)]] <- mice_simulation
    
  }
  
  return(output)
  
}

## ---- create-j2r-input

create_j2r_input <- function(data, var){
  
  input_variables <- 
    colnames(data)[grepl(var, names(data))]
  
  data <- 
    data[, names(data) %in% c("unique_id", 
                              "randomisation",
                              "sex", 
                              "age_cat", 
                              "education_cat", 
                              input_variables)]
  
  return(data)
  
}

## ---- apply-j2r

apply_j2r <- function(data_to_impute, var, iterations){
  
  set.seed(500)
  j2r_bootImps <- refBasedCts(data_to_impute, 
                              outcomeVarStem = paste0(var, "_t"), 
                              nVisits = 2, 
                              trtVar = "randomisation", 
                              baselineVars = paste0(var, "_t0"), 
                              type = "J2R", 
                              M = iterations)
  
  
  return(j2r_bootImps)
  
}

## ---- create-single-j2r-output

create_single_j2r <- function(j2rImps){
  
  j2r_bootImps_mids <- 
    datlist2mids(j2rImps, progress=FALSE)
  
  j2r_imputed_single <- 
    merge_imputations(data, 
                      j2r_bootImps_mids, 
                      ori = data)
  
  return(j2r_imputed_single)
  
}

## ---- simulate-j2r

simulate_j2r <- function(data, var, iterations){
  
  j2r_input <- create_j2r_input(data = data, 
                                var = var)
  
  j2r_output <- apply_j2r(data_to_impute = j2r_input, 
                          var = var, 
                          iterations = iterations)
  
  return(j2r_output)
  
}

## ---- simulate-j2r-bulk

simulate_j2r_bulk <- function(input, var, imp_iterations){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    j2r_simulation <- simulate_j2r(data = input[[sim]], 
                                   var = var, 
                                   iterations = imp_iterations)
    
    output[[paste(sim)]] <- j2r_simulation
    
  }
  
  return(output)
}

## ---- simulate-locf

simulate_locf <- function(data, var){
  
  data[[paste0(var, "_t1")]] <- ifelse(is.na(data[[paste0(var, "_t1")]]), 
                                       data[[paste0(var, "_t0")]], data[[paste0(var, "_t1")]])
  
  data[[paste0(var, "_t2")]] <- ifelse(is.na(data[[paste0(var, "_t2")]]), 
                                       data[[paste0(var, "_t1")]], data[[paste0(var, "_t2")]])
  
  return(data)
  
}

## ---- simulate-locf-bulk

simulate_locf_bulk <- function(input, var){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    locf_simulation <- simulate_locf(data = input[[sim]], 
                                     var = var)
    
    output[[paste(sim)]] <- locf_simulation
    
  }
  
  return(output)
}

## ---- prepare-mice-output

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

## ---- prepare-mice-long-data

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

## ---- pool-mice-models

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

## ---- mice-models-pipeline

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

## ---- mice-models-pipeline-bulk

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

## ---- prepare-j2r-output

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

## ---- prepare-j2r-long-data

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

## ---- pool-j2r-models

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

## ---- j2r-models-pipeline

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

## ---- j2r-models-pipeline-bulk

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

## ---- prepare-locf-output

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

## ---- prepare-locf-long-data

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

## ---- build-locf-model

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

## ---- locf-model-pipeline

apply_locf_model <- function(imp_object, var){
  
  prepare_var <- prepare_locf_output(imp_object = imp_object, 
                                     var = var)
  
  long_data <- prepare_locf_long(imp_object = prepare_var, 
                                 var = var)
  
  locf_model <- build_locf_model(imp_object = long_data, 
                                 var = var)
  
  return(locf_model)
  
}

## ---- locf-model-pipeline-bulk

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

## ---- prepare-lwd-data

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

## ---- prepare-lwd-long-data

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

## ---- build-lwd-model

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

## ---- lwd-model-pipeline

apply_lwd_model <- function(data, var){
  
  prepare_var <- prep_lwd_data(data = data, 
                               var = var)
  
  long_data <- prepare_lwd_long(data = prepare_var, 
                                var = var)
  
  lwd_model <- build_lwd_model(data = long_data, 
                               var = var)
  
  return(lwd_model)
  
}

## ---- lwd-model-pipeline

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