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

# physical-activity

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

## ---- J2R-imputation

# self-care
set.seed(500)
bootImps_sc <- refBasedCts(synthetic_data_missing_selfcare, 
                        outcomeVarStem="selfcare_t", 
                        nVisits=2, 
                        trtVar="randomisation", 
                        baselineVars="selfcare_t0", 
                        type="J2R", 
                        M=10)

bootImps_sc_mids <- datlist2mids(bootImps_sc, progress=FALSE)

j2r_imputed_single_sc <- merge_imputations(synthetic_data_missing_selfcare,
                                       bootImps_sc_mids, 
                                       ori = synthetic_data_missing_selfcare)

# physical-activity
set.seed(500)
bootImps_pa <- refBasedCts(synthetic_data_missing_physical_activity, 
                        outcomeVarStem="physical_activity_t", 
                        nVisits=2, 
                        trtVar="randomisation", 
                        baselineVars="physical_activity_t0", 
                        type="J2R", 
                        M=10)

bootImps_pa_mids <- datlist2mids(bootImps_pa, progress=FALSE)

j2r_imputed_single_pa <- merge_imputations(synthetic_data_missing_physical_activity,
                                       bootImps_pa_mids, 
                                       ori = synthetic_data_missing_physical_activity)