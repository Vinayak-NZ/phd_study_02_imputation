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

models_sc <- list()

models_rmse_sc <- list()

M <- length(miceImps)

for (mm in 1:M){
  
  models_sc[[mm]] <- lme4::lmer(formula, data = miceImps[[mm]], REML=FALSE)
  
  models_rmse_sc[[mm]] <- RMSE.merMod(models_sc[[mm]])
  
}

pooled_results_sc <- lmer_pool(models_sc, level = .95)

pooled_output_sc <- summary(pooled_results_sc)

mice_models_rmse_vector_sc <- unlist(models_rmse_sc, use.names=FALSE)

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

models_pa <- list()

models_rmse_pa <- list()

M <- length(miceImps)

for (mm in 1:M){
  
  models_pa[[mm]] <- lme4::lmer(formula, data = miceImps[[mm]], REML=FALSE)
  
  models_rmse_pa[[mm]] <- RMSE.merMod(models_pa[[mm]])
  
}

pooled_results_pa <- lmer_pool(models_pa, level = .95)

pooled_output_pa <- summary(pooled_results_pa)

mice_models_rmse_vector_pa <- unlist(models_rmse_pa, use.names=FALSE)