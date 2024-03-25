## ---- modelling-J2R

# self-care

for (i in 1:length(bootImps_sc)){
  
  bootImps_sc[[i]] <- bootImps_sc[[i]][, c("unique_id", 
                                     "randomisation", 
                                     "age_cat",
                                     "sex", 
                                     "education_cat", 
                                     "selfcare_t0", 
                                     "selfcare_t1",
                                     "selfcare_t2")]
  
  setDT(bootImps_sc[[i]])
  
  bootImps_sc[[i]] <- melt(bootImps_sc[[i]], 
                        id.vars = c("unique_id", 
                                    "randomisation", 
                                    "age_cat", 
                                    "sex", 
                                    "education_cat"), 
                        variable.name = "time", 
                        value.name = "selfcare")
  
  bootImps_sc[[i]][, "time"] <- ifelse(bootImps_sc[[i]][, "time"] == "selfcare_t0", 
                                    "baseline", 
                                    ifelse(bootImps_sc[[i]][, "time"] == "selfcare_t1", 
                                           "week-12", 
                                           "week-24"))
  
  bootImps_sc[[i]]$time <- as.factor(bootImps_sc[[i]]$time)
  
  bootImps_sc[[i]]$selfcare <- abs(as.numeric(bootImps_sc[[i]]$selfcare))
  
  bootImps_sc[[i]] <- as.data.frame(bootImps_sc[[i]])
  
}

formula <- selfcare ~ randomisation + time + randomisation*time + 
  age_cat + sex + 
  education_cat + (1|unique_id)

models_sc <- list()

models_rmse_sc <- list()

M <- length(bootImps_sc)

for (mm in 1:M){
  
  models_sc[[mm]] <- lme4::lmer(formula, data = bootImps_sc[[mm]], REML=FALSE)
  
  models_rmse_sc[[mm]] <- RMSE.merMod(models_sc[[mm]])
  
}

pooled_results_sc <- lmer_pool(models_sc, level = .95)

pooled_output_sc <- summary(pooled_results_sc)

models_rmse_vector_sc <- unlist(models_rmse_sc, use.names=FALSE)

# physical-activity

for (i in 1:length(bootImps_pa)){
  
  bootImps_pa[[i]] <- bootImps_pa[[i]][, c("unique_id", 
                                           "randomisation", 
                                           "age_cat",
                                           "sex", 
                                           "education_cat", 
                                           "physical_activity_t0", 
                                           "physical_activity_t1",
                                           "physical_activity_t2")]
  
  setDT(bootImps_pa[[i]])
  
  bootImps_pa[[i]] <- melt(bootImps_pa[[i]], 
                           id.vars = c("unique_id", 
                                       "randomisation", 
                                       "age_cat", 
                                       "sex", 
                                       "education_cat"), 
                           variable.name = "time", 
                           value.name = "physical_activity")
  
  bootImps_pa[[i]][, "time"] <- ifelse(bootImps_pa[[i]][, "time"] == "physical_activity_t0", 
                                       "baseline", 
                                       ifelse(bootImps_pa[[i]][, "time"] == "physical_activity_t1", 
                                              "week-12", 
                                              "week-24"))
  
  bootImps_pa[[i]]$time <- as.factor(bootImps_pa[[i]]$time)
  
  bootImps_pa[[i]]$physical_activity <- abs(as.numeric(bootImps_pa[[i]]$physical_activity))
  
  bootImps_pa[[i]] <- as.data.frame(bootImps_pa[[i]])
  
}

formula <- physical_activity ~ randomisation + time + randomisation*time + 
  age_cat + sex + 
  education_cat + (1|unique_id)

models_pa <- list()

models_rmse_pa <- list()

M <- length(bootImps_pa)

for (mm in 1:M){
  
  models_pa[[mm]] <- lme4::lmer(formula, data = bootImps_pa[[mm]], REML=FALSE)
  
  models_rmse_pa[[mm]] <- RMSE.merMod(models_pa[[mm]])
  
}

pooled_results <- lmer_pool(models_pa, level = .95)

pooled_output <- summary(pooled_results)

models_rmse_vector_pa <- unlist(models_rmse_pa, use.names=FALSE)
