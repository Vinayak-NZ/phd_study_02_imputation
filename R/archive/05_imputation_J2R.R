## ---- J2R-preparation

# self-care

synthetic_data_missing_selfcare <- 
  synthetic_data_missing[, names(synthetic_data_missing) %in% 
                                     c("unique_id", 
                                       "randomisation",
                                       "selfcare_t0", 
                                       "selfcare_t1",
                                       "selfcare_t2",
                                       "sex",
                                       "age_cat",
                                       "education_cat")]

synthetic_data_missing_physical_activity <- 
  synthetic_data_missing[, names(synthetic_data_missing) %in% 
                           c("unique_id", 
                             "randomisation",
                             "physical_activity_t0", 
                             "physical_activity_t1",
                             "physical_activity_t2",
                             "sex",
                             "age_cat",
                             "education_cat")]

## ---- multiple-imputation

# Jump 2 Reference imputation
set.seed(500)
bootImps <- refBasedCts(synthetic_data_missing_selfcare, 
                        outcomeVarStem="selfcare_t", 
                        nVisits=2, 
                        trtVar="randomisation", 
                        baselineVars="selfcare_t0", 
                        type="J2R", 
                        M=10)
