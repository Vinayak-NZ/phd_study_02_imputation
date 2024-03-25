## ---- modelling-LOCF

# convert to long data
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

# interaction effect
interaction.lmer <- lmer(selfcare ~ randomisation + time + randomisation*time + 
                           age_cat + sex + 
                           education_cat + (1|unique_id), 
                         data = long_data, 
                         REML = F)

interaction_model <- summary(interaction.lmer)

confint(interaction.lmer)
