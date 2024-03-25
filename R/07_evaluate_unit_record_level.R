## ---- evaluate-J2R

# self-care_t1

j2r_selfcare_t1 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                             predicted_data = j2r_imputed_single_sc,
                                             observed_var = "selfcare_t1",
                                             predicted_var = "selfcare_t1_imp")

# self-care_t2

j2r_selfcare_t2 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                             predicted_data = j2r_imputed_single_sc,
                                             observed_var = "selfcare_t2",
                                             predicted_var = "selfcare_t2_imp")

# physical_activity_t1

j2r_physical_activity_t1 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                                      predicted_data = j2r_imputed_single_pa,
                                                      observed_var = "physical_activity_t1",
                                                      predicted_var = "physical_activity_t1_imp")

# physical_activity_t2

j2r_physical_activity_t2 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                                      predicted_data = j2r_imputed_single_pa,
                                                      observed_var = "physical_activity_t2",
                                                      predicted_var = "physical_activity_t2_imp")

## ---- evaluate-MICE

# self-care_t1

mice_selfcare_t1 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                             predicted_data = data_mice,
                                             observed_var = "selfcare_t1",
                                             predicted_var = "selfcare_t1_imp")

# self-care_t2

mice_selfcare_t2 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                             predicted_data = data_mice,
                                             observed_var = "selfcare_t2",
                                             predicted_var = "selfcare_t2_imp")

# physical_activity_t1

mice_physical_activity_t1 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                                      predicted_data = data_mice,
                                                      observed_var = "physical_activity_t1",
                                                      predicted_var = "physical_activity_t1_imp")

# physical_activity_t2

mice_physical_activity_t2 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                                      predicted_data = data_mice,
                                                      observed_var = "physical_activity_t2",
                                                      predicted_var = "physical_activity_t2_imp")

## ---- evaluate-LOCF

# self-care_t1

locf_selfcare_t1 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                             predicted_data = post_locf,
                                             observed_var = "selfcare_t1",
                                             predicted_var = "selfcare_t1")

# self-care_t2

locf_selfcare_t2 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                             predicted_data = post_locf,
                                             observed_var = "selfcare_t2",
                                             predicted_var = "selfcare_t2")

# physical_activity_t1

locf_physical_activity_t1 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                                      predicted_data = post_locf,
                                                      observed_var = "physical_activity_t1",
                                                      predicted_var = "physical_activity_t1")

# physical_activity_t2

locf_physical_activity_t2 <- evaluate_unit_record_rmse(observed_data = synthetic_data_subset, 
                                                      predicted_data = post_locf,
                                                      observed_var = "physical_activity_t2",
                                                      predicted_var = "physical_activity_t2")
