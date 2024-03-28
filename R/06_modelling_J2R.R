## ---- modelling-J2R

# self-care

for (i in 1:length(j2r_bootImps_sc)){
  
  j2r_bootImps_sc[[i]] <- j2r_bootImps_sc[[i]][, c("unique_id", 
                                     "randomisation", 
                                     "age_cat",
                                     "sex", 
                                     "education_cat", 
                                     "selfcare_t0", 
                                     "selfcare_t1",
                                     "selfcare_t2")]
  
  setDT(j2r_bootImps_sc[[i]])
  
  j2r_bootImps_sc[[i]] <- melt(j2r_bootImps_sc[[i]], 
                        id.vars = c("unique_id", 
                                    "randomisation", 
                                    "age_cat", 
                                    "sex", 
                                    "education_cat"), 
                        variable.name = "time", 
                        value.name = "selfcare")
  
  j2r_bootImps_sc[[i]][, "time"] <- ifelse(j2r_bootImps_sc[[i]][, "time"] == "selfcare_t0", 
                                    "baseline", 
                                    ifelse(j2r_bootImps_sc[[i]][, "time"] == "selfcare_t1", 
                                           "week-12", 
                                           "week-24"))
  
  j2r_bootImps_sc[[i]]$time <- as.factor(j2r_bootImps_sc[[i]]$time)
  
  j2r_bootImps_sc[[i]]$selfcare <- abs(as.numeric(j2r_bootImps_sc[[i]]$selfcare))
  
  j2r_bootImps_sc[[i]] <- as.data.frame(j2r_bootImps_sc[[i]])
  
}

formula <- selfcare ~ randomisation + time + randomisation*time + 
  age_cat + sex + 
  education_cat + (1|unique_id)

models_sc <- list()

models_summary_sc <- list()

M <- length(j2r_bootImps_sc)

for (mm in 1:M){
  
  models_sc[[mm]] <- lme4::lmer(formula, data = j2r_bootImps_sc[[mm]], REML=FALSE)
  
  models_summary_sc[[mm]] <- summary(models_sc[[mm]])$coefficients[2]
  
}

j2r_pooled_results_sc <- lmer_pool(models_sc, level = .95)

j2r_pooled_output_sc <- summary(j2r_pooled_results_sc)

j2r_treatment_effect_sc <- unlist(models_summary_sc, use.names=FALSE)

# physical-activity

for (i in 1:length(j2r_bootImps_pa)){
  
  j2r_bootImps_pa[[i]] <- j2r_bootImps_pa[[i]][, c("unique_id", 
                                           "randomisation", 
                                           "age_cat",
                                           "sex", 
                                           "education_cat", 
                                           "physical_activity_t0", 
                                           "physical_activity_t1",
                                           "physical_activity_t2")]
  
  setDT(j2r_bootImps_pa[[i]])
  
  j2r_bootImps_pa[[i]] <- melt(j2r_bootImps_pa[[i]], 
                           id.vars = c("unique_id", 
                                       "randomisation", 
                                       "age_cat", 
                                       "sex", 
                                       "education_cat"), 
                           variable.name = "time", 
                           value.name = "physical_activity")
  
  j2r_bootImps_pa[[i]][, "time"] <- ifelse(j2r_bootImps_pa[[i]][, "time"] == "physical_activity_t0", 
                                       "baseline", 
                                       ifelse(j2r_bootImps_pa[[i]][, "time"] == "physical_activity_t1", 
                                              "week-12", 
                                              "week-24"))
  
  j2r_bootImps_pa[[i]]$time <- as.factor(j2r_bootImps_pa[[i]]$time)
  
  j2r_bootImps_pa[[i]]$physical_activity <- abs(as.numeric(j2r_bootImps_pa[[i]]$physical_activity))
  
  j2r_bootImps_pa[[i]] <- as.data.frame(j2r_bootImps_pa[[i]])
  
}

formula <- physical_activity ~ randomisation + time + randomisation*time + 
  age_cat + sex + 
  education_cat + (1|unique_id)

models_pa <- list()

models_summary_pa <- list()

M <- length(j2r_bootImps_pa)

for (mm in 1:M){
  
  models_pa[[mm]] <- lme4::lmer(formula, data = j2r_bootImps_pa[[mm]], REML=FALSE)
  
  models_summary_pa[[mm]] <- summary(models_pa[[mm]])$coefficients[2]
  
}

j2r_pooled_results_pa <- lmer_pool(models_pa, level = .95)

j2r_pooled_output_pa <- summary(j2r_pooled_results_pa)

j2r_treatment_effect_pa <- unlist(models_summary_pa, use.names=FALSE)
