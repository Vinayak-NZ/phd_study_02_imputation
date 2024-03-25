## ---- modelling-j2r

for (i in 1:length(bootImps)){
  
  bootImps[[i]] <- bootImps[[i]][, c("unique_id", 
                                     "randomisation", 
                                     "age_cat",
                                     "sex", 
                                     "education_cat", 
                                     "selfcare_t0", 
                                     "selfcare_t1",
                                     "selfcare_t2")]
  
  setDT(bootImps[[i]])
  
  bootImps[[i]] <- melt(bootImps[[i]], 
                        id.vars = c("unique_id", 
                                    "randomisation", 
                                    "age_cat", 
                                    "sex", 
                                    "education_cat"), 
                        variable.name = "time", 
                        value.name = "selfcare")
  
  bootImps[[i]][, "time"] <- ifelse(bootImps[[i]][, "time"] == "selfcare_t0", 
                                    "baseline", 
                                    ifelse(bootImps[[i]][, "time"] == "selfcare_t1", 
                                           "week-12", 
                                           "week-24"))
  
  bootImps[[i]]$time <- as.factor(bootImps[[i]]$time)
  
  bootImps[[i]]$selfcare <- abs(as.numeric(bootImps[[i]]$selfcare))
  
  bootImps[[i]] <- as.data.frame(bootImps[[i]])
  
}

formula <- selfcare ~ randomisation + time + randomisation*time + 
  age_cat + sex + 
  education_cat + (1|unique_id)

models <- list()

M <- length(bootImps)

for (mm in 1:M){
  
  models[[mm]] <- lme4::lmer(formula, data = bootImps[[mm]], REML=FALSE)
  
}

pooled_results <- lmer_pool(models, level = .95)

pooled_output <- summary(pooled_results)
