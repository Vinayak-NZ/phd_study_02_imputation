## ---- MICE-modelling

# self-care

miceImps <- list()

for (i in 1:mi_object$m){
  
  miceImps[[i]] <- complete(mi_object, i)
  
  miceImps[[i]]  <- merge(data_remainder, 
                          miceImps[[i]], 
                          by = "unique_id")
  
}

for (i in 1:length(miceImps)){
  
  
  
  
  miceImps[[i]] <- miceImps[[i]][, c("unique_id", 
                                     "randomisation", 
                                     "age_cat", 
                                     "sex", 
                                     "education_cat", 
                                     "selfcare_t0", 
                                     "selfcare_t1", 
                                     "selfcare_t2")]
  
  setDT(miceImps[[i]])
  
  miceImps[[i]] <- melt(miceImps[[i]], 
                        id.vars = c("unique_id", 
                                    "randomisation", 
                                    "age_cat", 
                                    "sex", 
                                    "education_cat"), 
                        variable.name = "time", 
                        value.name = "selfcare")
  
  miceImps[[i]][, "time"] <- ifelse(miceImps[[i]][, "time"] == "selfcare_t0", 
                                    "baseline", 
                                    ifelse(miceImps[[i]][, "time"] == "selfcare_t1", 
                                           "week-12", 
                                           "week-24"))
  
  miceImps[[i]]$time <- as.factor(miceImps[[i]]$time)
  
  miceImps[[i]]$selfcare <- abs(as.numeric(miceImps[[i]]$selfcare))
  
  miceImps[[i]] <- as.data.frame(miceImps[[i]])
  
}

formula <- selfcare ~ randomisation + time + randomisation*time + 
  age_cat + sex + 
  education_cat + (1|unique_id)

mice_models_sc <- list()

mice_models_summary_sc <- list()

M <- length(miceImps)

for (mm in 1:M){
  
  mice_models_sc[[mm]] <- lme4::lmer(formula, data = miceImps[[mm]], REML=FALSE)
  
  mice_models_summary_sc[[mm]] <- summary(mice_models_sc[[mm]])$coefficients[2]
  
}

mice_pooled_results_sc <- lmer_pool(mice_models_sc, level = .95)

mice_pooled_output_sc <- summary(mice_pooled_results_sc)

mice_treatment_effect_sc <- unlist(mice_models_summary_sc, use.names=FALSE)

# physical-activity

miceImps <- list()

for (i in 1:mi_object$m){
  
  miceImps[[i]] <- complete(mi_object, i)
  
  miceImps[[i]]  <- merge(data_remainder, 
                          miceImps[[i]], 
                          by = "unique_id")
  
}

for (i in 1:length(miceImps)){
  
  
  
  
  miceImps[[i]] <- miceImps[[i]][, c("unique_id", 
                                     "randomisation", 
                                     "age_cat", 
                                     "sex", 
                                     "education_cat", 
                                     "physical_activity_t0", 
                                     "physical_activity_t1", 
                                     "physical_activity_t2")]
  
  setDT(miceImps[[i]])
  
  miceImps[[i]] <- melt(miceImps[[i]], 
                        id.vars = c("unique_id", 
                                    "randomisation", 
                                    "age_cat", 
                                    "sex", 
                                    "education_cat"), 
                        variable.name = "time", 
                        value.name = "physical_activity")
  
  miceImps[[i]][, "time"] <- ifelse(miceImps[[i]][, "time"] == "physical_activity_t0", 
                                    "baseline", 
                                    ifelse(miceImps[[i]][, "time"] == "physical_activity_t1", 
                                           "week-12", 
                                           "week-24"))
  
  miceImps[[i]]$time <- as.factor(miceImps[[i]]$time)
  
  miceImps[[i]]$physical_activity <- abs(as.numeric(miceImps[[i]]$physical_activity))
  
  miceImps[[i]] <- as.data.frame(miceImps[[i]])
  
}

formula <- physical_activity ~ randomisation + time + randomisation*time + 
  age_cat + sex + 
  education_cat + (1|unique_id)

mice_models_pa <- list()

mice_models_summary_pa <- list()

M <- length(miceImps)

for (mm in 1:M){
  
  mice_models_pa[[mm]] <- lme4::lmer(formula, data = miceImps[[mm]], REML=FALSE)
  
  mice_models_summary_pa[[mm]] <- summary(mice_models_pa[[mm]])$coefficients[2]
  
}

mice_pooled_results_pa <- lmer_pool(mice_models_pa, level = .95)

mice_pooled_output_pa <- summary(mice_pooled_results_pa)

mice_treatment_effect_pa <- unlist(mice_models_summary_pa, use.names=FALSE)