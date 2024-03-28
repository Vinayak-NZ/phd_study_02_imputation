## ---- modelling-observed

synthetic_data_subset$unique_id <- c(1:226)

# self-care

subset_data <- synthetic_data_subset[, c("unique_id", 
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

interaction.lmer <- lmer(selfcare ~ randomisation + time + randomisation*time + 
                           age_cat + sex + 
                           education_cat + (1|unique_id), 
                         data = long_data, 
                         REML = F)

observed_model_summary_sc <- summary(interaction.lmer)

confint(interaction.lmer)

observed_treatment_effect_sc <- observed_model_summary_sc$coefficients[2]

# physical-activity

subset_data <- synthetic_data_subset[, c("unique_id", 
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

interaction.lmer <- lmer(physical_activity ~ randomisation + time + randomisation*time + 
                           age_cat + sex + 
                           education_cat + (1|unique_id), 
                         data = long_data, 
                         REML = F)

observed_model_summary_pa <- summary(interaction.lmer)

confint(interaction.lmer)

observed_treatment_effect_pa <- observed_model_summary_pa$coefficients[2]