
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

models <- list()

M <- length(miceImps)

for (mm in 1:M){
  
  models[[mm]] <- lme4::lmer(formula, data = miceImps[[mm]], REML=FALSE)
  
}

pooled_results <- lmer_pool(models, level = .95)

pooled_output <- summary(pooled_results)
