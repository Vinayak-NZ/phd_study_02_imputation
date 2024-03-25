## ---- subset-data

subset_data <- raw_data[, names(raw_data) %in% 
                          c("lfdn",
                            "randomisation",
                            "sex", 
                            "age", 
                            "education", 
                            "hypertension", 
                            "heart_disease", 
                            "heart_failure", 
                            "selfcare_index", 
                            "selfcare_index_t1", 
                            "self_efficacy_index", 
                            "self_efficacy_index_t1", 
                            "sit_min_all", 
                            "sit_min_all_t1",
                            "v_97",
                            "v_97_t1",
                            "xl_vig", 
                            "xl_mod", 
                            "xl_wal", 
                            "xl_all",
                            "xl_vig_t1", 
                            "xl_mod_t1", 
                            "xl_wal_t1",
                            "xl_all_t1",
                            "v_125_t1")]

## ---- rename-variables

colnames(subset_data)[colnames(subset_data) == 'selfcare_index'] <- 'selfcare_t0'

colnames(subset_data)[colnames(subset_data) == 'selfcare_index_t1'] <- 'selfcare_t1'

colnames(subset_data)[colnames(subset_data) == 'self_efficacy_index'] <- 'self_efficacy_t0'

colnames(subset_data)[colnames(subset_data) == 'self_efficacy_index_t1'] <- 'self_efficacy_t1'

colnames(subset_data)[colnames(subset_data) == 'sit_min_all'] <- 'ipaq_sit_t0'

colnames(subset_data)[colnames(subset_data) == 'sit_min_all_t1'] <- 'ipaq_sit_t1'

colnames(subset_data)[colnames(subset_data) == 'xl_vig'] <- 'ipaq_vigorous_t0'

colnames(subset_data)[colnames(subset_data) == 'xl_vig_t1'] <- 'ipaq_vigorous_t1'

colnames(subset_data)[colnames(subset_data) == 'xl_mod'] <- 'ipaq_moderate_t0'

colnames(subset_data)[colnames(subset_data) == 'xl_mod_t1'] <- 'ipaq_moderate_t1'

colnames(subset_data)[colnames(subset_data) == 'xl_wal'] <- 'ipaq_walking_t0'

colnames(subset_data)[colnames(subset_data) == 'xl_wal_t1'] <- 'ipaq_walking_t1'

colnames(subset_data)[colnames(subset_data) == 'v_97'] <- 'ipaq_walking_indicator_t0'

colnames(subset_data)[colnames(subset_data) == 'v_97_t1'] <- 'ipaq_walking_indicator_t1'

colnames(subset_data)[colnames(subset_data) == 'xl_all'] <- 'physical_activity_t0'

colnames(subset_data)[colnames(subset_data) == 'xl_all_t1'] <- 'physical_activity_t1'

colnames(subset_data)[colnames(subset_data) == 'v_125_t1'] <- 'app_recommendation'

## ---- modify-variable-coding

# change raw data: code ldfn as a factor
subset_data$lfdn <- as.factor(subset_data$lfdn)

# change raw data: code randomisation as 0 and 1
subset_data$randomisation <- 
  factor(subset_data$randomisation, 
         levels = c("control", "intervention"), 
         labels = c(0, 1))

# change raw data: start all categorical dv levels with 1 (i.e. no 0s for hypertension, heart disease and heart failure)
subset_data$sex <- 
  factor(subset_data$sex, 
         levels = c("male", "female"), 
         labels = c(1:2))

subset_data$hypertension <- factor(subset_data$hypertension,
                                   levels = c("no", "yes"),
                                   labels = c(1:2))

subset_data$heart_disease <- factor(subset_data$heart_disease,
                                    levels = c("no", "yes"),
                                    labels = c(1:2))

subset_data$heart_failure <- factor(subset_data$heart_failure,
                                    levels = c("no", "yes"),
                                    labels = c(1:2))

subset_data$education <- 
  factor(subset_data$education, 
         levels = c("Schule beendet ohne Schulabschluss", 
                    "Haupt- oder Volkshochschule", 
                    "Realschulabschluss/ Mittlere Reife/ Fachschulreife",  
                    "POS (Polytechnische Oberschule) bzw. 10. Klasse (vor 1965: 8. Klasse)",  
                    "Fachhochschulreife/ Abschluss einer Fachoberschule", 
                    "Abitur, allgemeine oder fachgebundene Hochschulreife/ Erweiterte Oberschule (EOS)", 
                    "Anderer Schulabschluss"), 
         labels = c(1:7))

subset_data$ipaq_walking_indicator_t0 <- 
  factor(subset_data$ipaq_walking_indicator_t0, 
         levels = c("not applicable", "applicable"), 
         labels = c(1:2))

subset_data$ipaq_walking_indicator_t1 <- 
  factor(subset_data$ipaq_walking_indicator_t1, 
         levels = c("not applicable", "applicable"), 
         labels = c(1:2))

subset_data$app_recommendation <- 
  factor(subset_data$app_recommendation, 
         levels = c("extremely unlikely", 
                    "unlikely", 
                    "neither likely nor unlikely", 
                    "probably", 
                    "very likely"), 
         labels = c(1:5))


subset_data <- derive_age_cat(subset_data, "age", "age_cat")

subset_data <- derive_edu_cat(subset_data, "education", "education_cat")
