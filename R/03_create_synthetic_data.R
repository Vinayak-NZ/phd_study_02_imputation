## ---- create-synthetic-data

# remove identifier
subset_data_pre_synth <- subset_data[, !(colnames(subset_data) %in% c("lfdn", 
                                                                      "app_recommendation", 
                                                                      "self_efficacy_t0", 
                                                                      "self_efficacy_t1", 
                                                                      "ipaq_sit_t0", 
                                                                      "ipaq_sit_t1", 
                                                                      "ipaq_walking_indicator_t0", 
                                                                      "ipaq_walking_indicator_t1", 
                                                                      "ipaq_vigorous_t0", 
                                                                      "ipaq_vigorous_t1", 
                                                                      "ipaq_moderate_t0", 
                                                                      "ipaq_moderate_t1", 
                                                                      "ipaq_walking_t0", 
                                                                      "ipaq_walking_t1", 
                                                                      "age_cat", 
                                                                      "education_cat"))]

subset_data_pre_synth <- subset_data_pre_synth[complete.cases(subset_data_pre_synth), ]

# create synthetic data with 226 records
control <- subset_data_pre_synth[subset_data_pre_synth$randomisation == 0, ]

intervention <- subset_data_pre_synth[subset_data_pre_synth$randomisation == 1, ]

synthetic_control <- create_follow_up(control)

synthetic_intervention <- create_follow_up(intervention)

synthetic_data <- rbind(synthetic_control, synthetic_intervention)

# create follow up

synthetic_data$selfcare_t2 <- 
  synthetic_data$selfcare_t1*synthetic_data$self_care_rate_change

synthetic_data$physical_activity_t2 <- 
  synthetic_data$physical_activity_t1*synthetic_data$total_physical_activity_rate_change

# drop rate change variables
synthetic_data <- synthetic_data[, !(names(synthetic_data) %in% c('self_care_rate_change', 
                                                                  'total_physical_activity_rate_change'))]


# data comparisons
synthetic_data_comparison <- synthetic_data[, !(names(synthetic_data) %in% c('selfcare_t2', 
                                                                             'physical_activity_t2'))]

compare(synthetic_data_comparison, subset_data_pre_synth, stat = "percents")

# subset data

subset_vars <- c("randomisation", "sex", "age","education", 
                 "hypertension", "heart_disease", "heart_failure", 
                 "selfcare", "physical_activity")

synthetic_data_subset <- synthetic_data[, grepl(paste(subset_vars, collapse = "|"), 
                                                names(synthetic_data))]

synthetic_data_subset <- derive_age_cat(synthetic_data_subset, "age", "age_cat")

synthetic_data_subset <- derive_edu_cat(synthetic_data_subset, "education", "education_cat")

subset_vars <- c("randomisation", "sex", "age_cat", "education_cat", 
                 "hypertension", "heart_disease", "heart_failure", 
                 "selfcare", "physical_activity")

synthetic_data_subset <- synthetic_data_subset[, grepl(paste(subset_vars, collapse = "|"), 
                                                names(synthetic_data_subset))]
