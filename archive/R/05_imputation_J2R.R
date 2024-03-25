## ---- J2R-preparation

synthetic_data_missing_sit <- 
  synthetic_data_missing[, names(synthetic_data_missing) %in% 
                                     c("unique_id", 
                                       "randomisation",
                                       "ipaq_sit_t0", 
                                       "ipaq_sit_t1",
                                       "ipaq_sit_t2",
                                       "sex",
                                       "education")]

synthetic_data_missing_walk <- 
  synthetic_data_missing[, names(synthetic_data_missing) %in% 
                           c("unique_id", 
                             "randomisation",
                             "ipaq_walking_t0", 
                             "ipaq_walking_t1",
                             "ipaq_walking_t2",
                             "sex",
                             "education")]

synthetic_data_missing_mod <- 
  synthetic_data_missing[, names(synthetic_data_missing) %in% 
                           c("unique_id", 
                             "randomisation",
                             "ipaq_moderate_t0", 
                             "ipaq_moderate_t1",
                             "ipaq_moderate_t2",
                             "sex",
                             "education")]

synthetic_data_missing_vig <- 
  synthetic_data_missing[, names(synthetic_data_missing) %in% 
                           c("unique_id", 
                             "randomisation",
                             "ipaq_vigorous_t0", 
                             "ipaq_vigorous_t1",
                             "ipaq_vigorous_t2",
                             "sex",
                             "education")]

## ---- multiple-imputation

# Jump 2 Reference imputation
set.seed(500)
bootImps <- refBasedCts(synthetic_data_missing, 
                        outcomeVarStem="ipaq_sit_t", 
                        nVisits=2, 
                        trtVar="randomisation", 
                        baselineVars="ipaq_sit_t0", 
                        type="J2R", 
                        M=10)