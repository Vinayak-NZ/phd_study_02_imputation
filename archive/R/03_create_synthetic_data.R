## ---- create-synthetic-data

# remove identifier
subset_data_pre_synth <- subset_data[, !(colnames(subset_data) %in% c("lfdn", 
                                                                      "app_recommendation", 
                                                                      "ipaq_walking_indicator_t0", 
                                                                      "ipaq_walking_indicator_t1"))]

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

synthetic_data$self_efficacy_t2 <- 
  synthetic_data$self_efficacy_t1*synthetic_data$self_efficacy_rate_change

synthetic_data$ipaq_sit_t2 <- 
  synthetic_data$ipaq_sit_t1*synthetic_data$sitting_rate_change

synthetic_data$ipaq_walking_t2 <- 
  synthetic_data$ipaq_walking_t1*synthetic_data$walking_rate_change

synthetic_data$ipaq_moderate_t2 <- 
  synthetic_data$ipaq_moderate_t1*synthetic_data$mod_activity_rate_change

synthetic_data$ipaq_vigorous_t2 <- 
  synthetic_data$ipaq_vigorous_t1*synthetic_data$vig_activity_rate_change

# drop rate change variables
synthetic_data <- synthetic_data[, !(names(synthetic_data) %in% c('self_care_rate_change', 
                                                                  'self_efficacy_rate_change', 
                                                                  'sitting_rate_change', 
                                                                  'walking_rate_change',
                                                                  'mod_activity_rate_change', 
                                                                  'vig_activity_rate_change'))]


# data comparisons
synthetic_data_comparison <- synthetic_data[, !(names(synthetic_data) %in% c('selfcare_t2', 
                                                                             'self_efficacy_t2', 
                                                                             'ipaq_sit_t2', 
                                                                             'ipaq_walking_t2',
                                                                             'ipaq_moderate_t2', 
                                                                             'ipaq_vigorous_t2'))]

compare(synthetic_data_comparison, subset_data_pre_synth, stat = "percents")

# subset data

subset_vars <- c("randomisation", "sex", "education", 
                 "hypertension", "heart_disease", "heart_failure", 
                 "ipaq_sit", "ipaq_walking", 
                 "ipaq_moderate", "ipaq_vigorous")

synthetic_data_subset <- synthetic_data[, grepl(paste(subset_vars, collapse = "|"), 
                                                names(synthetic_data))]
