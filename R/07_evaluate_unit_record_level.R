## ---- evaluate-urd-MICE

#MCAR-20-SC-t1
sc_t1_mice_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_20, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "MICE"))

#MCAR-30-SC-t1
sc_t1_mice_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_30, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "MICE"))

#MCAR-40-SC-t1
sc_t1_mice_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_40, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "MICE"))

#MAR-20-SC-t1
sc_t1_mice_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_20, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "MICE"))

#MAR-30-SC-t1
sc_t1_mice_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_30, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "MICE"))

#MAR-40-SC-t1
sc_t1_mice_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_40, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "MICE"))

#MNAR-20-SC-t1
sc_t1_mice_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_20, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "MICE"))

#MNAR-30-SC-t1
sc_t1_mice_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_30, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "MICE"))

#MNAR-40-SC-t1
sc_t1_mice_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_40, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "MICE"))

#MCAR-20-SC-t2
sc_t2_mice_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_20, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "MICE"))

#MCAR-30-SC-t2
sc_t2_mice_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_30, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "MICE"))

#MCAR-40-SC-t2
sc_t2_mice_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_40, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "MICE"))

#MAR-20-SC-t2
sc_t2_mice_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_20, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "MICE"))

#MAR-30-SC-t2
sc_t2_mice_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_30, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "MICE"))

#MAR-40-SC-t2
sc_t2_mice_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_40, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "MICE"))

#MNAR-20-SC-t2
sc_t2_mice_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_20, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "MICE"))

#MNAR-30-SC-t2
sc_t2_mice_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_30, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "MICE"))

#MNAR-40-SC-t2
sc_t2_mice_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_40, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "MICE"))

#MCAR-20-PA-t1
pa_t1_mice_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_20, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "MICE"))

#MCAR-30-PA-t1
pa_t1_mice_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_30, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "MICE"))

#MCAR-40-PA-t1
pa_t1_mice_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_40, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "MICE"))

#MAR-20-PA-t1
pa_t1_mice_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_20, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "MICE"))

#MAR-30-PA-t1
pa_t1_mice_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_30, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "MICE"))

#MAR-40-PA-t1
pa_t1_mice_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_40, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "MICE"))

#MNAR-20-PA-t1
pa_t1_mice_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_20, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "MICE"))

#MNAR-30-PA-t1
pa_t1_mice_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_30, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "MICE"))

#MNAR-40-PA-t1
pa_t1_mice_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_40, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "MICE"))

#MCAR-20-PA-t2
pa_t2_mice_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_20, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "MICE"))

#MCAR-30-PA-t2
pa_t2_mice_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_30, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "MICE"))

#MCAR-40-PA-t2
pa_t2_mice_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_40, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "MICE"))

#MAR-20-PA-t2
pa_t2_mice_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_20, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "MICE"))

#MAR-30-PA-t2
pa_t2_mice_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_30, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "MICE"))

#MAR-40-PA-t2
pa_t2_mice_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_40, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "MICE"))

#MNAR-20-PA-t2
pa_t2_mice_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_20, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "MICE"))

#MNAR-30-PA-t2
pa_t2_mice_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_30, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "MICE"))

#MNAR-40-PA-t2
pa_t2_mice_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_40, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "MICE"))

## ---- evaluate-urd-J2R

#MCAR-20-SC-t1
sc_t1_j2r_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_20, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "J2R"))

#MCAR-30-SC-t1
sc_t1_j2r_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_30, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "J2R"))

#MCAR-40-SC-t1
sc_t1_j2r_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_40, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "J2R"))

#MAR-20-SC-t1
sc_t1_j2r_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_20, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "J2R"))

#MAR-30-SC-t1
sc_t1_j2r_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_30, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "J2R"))

#MAR-40-SC-t1
sc_t1_j2r_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_40, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "J2R"))

#MNAR-20-SC-t1
sc_t1_j2r_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_20, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "J2R"))

#MNAR-30-SC-t1
sc_t1_j2r_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_30, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "J2R"))

#MNAR-40-SC-t1
sc_t1_j2r_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_40, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1_imp", 
    method = "J2R"))

#MCAR-20-SC-t2
sc_t2_j2r_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_20, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "J2R"))

#MCAR-30-SC-t2
sc_t2_j2r_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_30, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "J2R"))

#MCAR-40-SC-t2
sc_t2_j2r_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_40, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "J2R"))

#MAR-20-SC-t2
sc_t2_j2r_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_20, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "J2R"))

#MAR-30-SC-t2
sc_t2_j2r_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_30, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "J2R"))

#MAR-40-SC-t2
sc_t2_j2r_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_40, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "J2R"))

#MNAR-20-SC-t2
sc_t2_j2r_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_20, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "J2R"))

#MNAR-30-SC-t2
sc_t2_j2r_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_30, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "J2R"))

#MNAR-40-SC-t2
sc_t2_j2r_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_40, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2_imp", 
    method = "J2R"))

#MCAR-20-PA-t1
pa_t1_j2r_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_20, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "J2R"))

#MCAR-30-PA-t1
pa_t1_j2r_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_30, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "J2R"))

#MCAR-40-PA-t1
pa_t1_j2r_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_40, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "J2R"))

#MAR-20-PA-t1
pa_t1_j2r_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_20, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "J2R"))

#MAR-30-PA-t1
pa_t1_j2r_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_30, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "J2R"))

#MAR-40-PA-t1
pa_t1_j2r_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_40, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "J2R"))

#MNAR-20-PA-t1
pa_t1_j2r_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_20, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "J2R"))

#MNAR-30-PA-t1
pa_t1_j2r_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_30, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "J2R"))

#MNAR-40-PA-t1
pa_t1_j2r_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_40, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1_imp", 
    method = "J2R"))

#MCAR-20-PA-t2
pa_t2_j2r_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_20, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "J2R"))

#MCAR-30-PA-t2
pa_t2_j2r_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_30, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "J2R"))

#MCAR-40-PA-t2
pa_t2_j2r_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_40, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "J2R"))

#MAR-20-PA-t2
pa_t2_j2r_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_20, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "J2R"))

#MAR-30-PA-t2
pa_t2_j2r_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_30, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "J2R"))

#MAR-40-PA-t2
pa_t2_j2r_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_40, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "J2R"))

#MNAR-20-PA-t2
pa_t2_j2r_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_20, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "J2R"))

#MNAR-30-PA-t2
pa_t2_j2r_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_30, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "J2R"))

#MNAR-40-PA-t2
pa_t2_j2r_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_40, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2_imp", 
    method = "J2R"))

## ---- evaluate-urd-LOCF

#MCAR-20-SC-t1
sc_t1_locf_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_20, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1", 
    method = "LOCF"))

#MCAR-30-SC-t1
sc_t1_locf_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_30, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1", 
    method = "LOCF"))

#MCAR-40-SC-t1
sc_t1_locf_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_40, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1", 
    method = "LOCF"))

#MAR-20-SC-t1
sc_t1_locf_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_20, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1", 
    method = "LOCF"))

#MAR-30-SC-t1
sc_t1_locf_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_30, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1", 
    method = "LOCF"))

#MAR-40-SC-t1
sc_t1_locf_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_40, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1", 
    method = "LOCF"))

#MNAR-20-SC-t1
sc_t1_locf_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_20, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1", 
    method = "LOCF"))

#MNAR-30-SC-t1
sc_t1_locf_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_30, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1", 
    method = "LOCF"))

#MNAR-40-SC-t1
sc_t1_locf_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_40, 
    observed_var = "selfcare_t1", 
    predicted_var = "selfcare_t1", 
    method = "LOCF"))

#MCAR-20-SC-t2
sc_t2_locf_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_20, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2", 
    method = "LOCF"))

#MCAR-30-SC-t2
sc_t2_locf_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_30, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2", 
    method = "LOCF"))

#MCAR-40-SC-t2
sc_t2_locf_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mcar_40, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2", 
    method = "LOCF"))

#MAR-20-SC-t2
sc_t2_locf_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_20, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2", 
    method = "LOCF"))

#MAR-30-SC-t2
sc_t2_locf_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_30, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2", 
    method = "LOCF"))

#MAR-40-SC-t2
sc_t2_locf_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mar_40, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2", 
    method = "LOCF"))

#MNAR-20-SC-t2
sc_t2_locf_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_20, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2", 
    method = "LOCF"))

#MNAR-30-SC-t2
sc_t2_locf_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_30, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2", 
    method = "LOCF"))

#MNAR-40-SC-t2
sc_t2_locf_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = sc_missing_mnar_40, 
    observed_var = "selfcare_t2", 
    predicted_var = "selfcare_t2", 
    method = "LOCF"))

#MCAR-20-PA-t1
pa_t1_locf_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_20, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1", 
    method = "LOCF"))

#MCAR-30-PA-t1
pa_t1_locf_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_30, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1", 
    method = "LOCF"))

#MCAR-40-PA-t1
pa_t1_locf_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_40, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1", 
    method = "LOCF"))

#MAR-20-PA-t1
pa_t1_locf_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_20, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1", 
    method = "LOCF"))

#MAR-30-PA-t1
pa_t1_locf_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_30, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1", 
    method = "LOCF"))

#MAR-40-PA-t1
pa_t1_locf_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_40, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1", 
    method = "LOCF"))

#MNAR-20-PA-t1
pa_t1_locf_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_20, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1", 
    method = "LOCF"))

#MNAR-30-PA-t1
pa_t1_locf_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_30, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1", 
    method = "LOCF"))

#MNAR-40-PA-t1
pa_t1_locf_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_40, 
    observed_var = "physical_activity_t1", 
    predicted_var = "physical_activity_t1", 
    method = "LOCF"))

#MCAR-20-PA-t2
pa_t2_locf_mcar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_20, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2", 
    method = "LOCF"))

#MCAR-30-PA-t2
pa_t2_locf_mcar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_30, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2", 
    method = "LOCF"))

#MCAR-40-PA-t2
pa_t2_locf_mcar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mcar_40, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2", 
    method = "LOCF"))

#MAR-20-PA-t2
pa_t2_locf_mar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_20, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2", 
    method = "LOCF"))

#MAR-30-PA-t2
pa_t2_locf_mar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_30, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2", 
    method = "LOCF"))

#MAR-40-PA-t2
pa_t2_locf_mar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mar_40, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2", 
    method = "LOCF"))

#MNAR-20-PA-t2
pa_t2_locf_mnar_20_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_20, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2", 
    method = "LOCF"))

#MNAR-30-PA-t2
pa_t2_locf_mnar_30_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_30, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2", 
    method = "LOCF"))

#MNAR-40-PA-t2
pa_t2_locf_mnar_40_urd <- mean(
  evaluate_unit_record_rmse_bulk(
    observed_data = synthetic_data_subset, 
    input = pa_missing_mnar_40, 
    observed_var = "physical_activity_t2", 
    predicted_var = "physical_activity_t2", 
    method = "LOCF"))
