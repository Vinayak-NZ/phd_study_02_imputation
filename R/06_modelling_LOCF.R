## ---- modelling-LOCF

# self-care
subset_data <- post_locf[, c("unique_id", 
                             "randomisation", 
                             "age_cat", 
                             "sex", 
                             "education_cat", 
                             "selfcare_t0", 
                             "selfcare_t1", 
                             "selfcare_t2")]

subset_data <- subset_data[complete.cases(subset_data), ]

setDT(subset_data)

long_data <- melt(subset_data, 
                  id.vars = c("unique_id", 
                              "randomisation", 
                              "age_cat", 
                              "sex", 
                              "education_cat"), 
                  variable.name = "time", 
                  value.name = "selfcare")

long_data[, "time"] <- ifelse(long_data[, "time"] == "selfcare_t0", 
                              "baseline", 
                              ifelse(long_data[, "time"] == "selfcare_t1", 
                                     "week-12", 
                                     "week-24"))

locf_model_sc <- lmer(selfcare ~ randomisation + time + randomisation*time + 
                           age_cat + sex + 
                           education_cat + (1|unique_id), 
                         data = long_data, 
                         REML = F)

interaction_model <- summary(locf_model_sc)

confint(locf_model_sc)

# physical-activity
subset_data <- post_locf[, c("unique_id", 
                             "randomisation", 
                             "age_cat", 
                             "sex", 
                             "education_cat", 
                             "physical_activity_t0", 
                             "physical_activity_t1", 
                             "physical_activity_t2")]

subset_data <- subset_data[complete.cases(subset_data), ]

setDT(subset_data)

long_data <- melt(subset_data, 
                  id.vars = c("unique_id", 
                              "randomisation", 
                              "age_cat", 
                              "sex", 
                              "education_cat"), 
                  variable.name = "time", 
                  value.name = "physical_activity")

long_data[, "time"] <- ifelse(long_data[, "time"] == "physical_activity_t0", 
                              "baseline", 
                              ifelse(long_data[, "time"] == "physical_activity_t1", 
                                     "week-12", 
                                     "week-24"))

locf_model_pa <- lmer(physical_activity ~ randomisation + time + randomisation*time + 
                        age_cat + sex + 
                        education_cat + (1|unique_id), 
                      data = long_data, 
                      REML = F)

interaction_model <- summary(locf_model_pa)

confint(locf_model_pa)

