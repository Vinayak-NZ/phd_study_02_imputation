## ---- evaluate-treatment-effect-J2R

#MCAR-20-SC
sc_j2r_mcar_20_te <- mean(
  derive_treatment_rmse(sc_j2r_model_mcar_20, 
                        observed_treatment_effect_sc))

#MCAR-30-SC
sc_j2r_mcar_30_te <- mean(
  derive_treatment_rmse(sc_j2r_model_mcar_30, 
                        observed_treatment_effect_sc))

#MCAR-40-SC
sc_j2r_mcar_40_te <- mean(
  derive_treatment_rmse(sc_j2r_model_mcar_40, 
                        observed_treatment_effect_sc))

#MAR-20-SC
sc_j2r_mar_20_te <- mean(
  derive_treatment_rmse(sc_j2r_model_mar_20, 
                        observed_treatment_effect_sc))

#MAR-30-SC
sc_j2r_mar_30_te <- mean(
  derive_treatment_rmse(sc_j2r_model_mar_30, 
                        observed_treatment_effect_sc))

#MAR-40-SC
sc_j2r_mar_40_te <- mean(
  derive_treatment_rmse(sc_j2r_model_mar_40, 
                        observed_treatment_effect_sc))

#MNAR-20-SC
sc_j2r_mnar_20_te <- mean(
  derive_treatment_rmse(sc_j2r_model_mnar_20, 
                        observed_treatment_effect_sc))

#MNAR-30-SC
sc_j2r_mnar_30_te <- mean(
  derive_treatment_rmse(sc_j2r_model_mnar_30, 
                        observed_treatment_effect_sc))

#MNAR-40-SC
sc_j2r_mnar_40_te <- mean(
  derive_treatment_rmse(sc_j2r_model_mnar_40, 
                        observed_treatment_effect_sc))

#MCAR-20-PA
pa_j2r_mcar_20_te <- mean(
  derive_treatment_rmse(pa_j2r_model_mcar_20, 
                        observed_treatment_effect_pa))

#MCAR-30-PA
pa_j2r_mcar_30_te <- mean(
  derive_treatment_rmse(pa_j2r_model_mcar_30, 
                        observed_treatment_effect_pa))

#MCAR-40-PA
pa_j2r_mcar_40_te <- mean(
  derive_treatment_rmse(pa_j2r_model_mcar_40, 
                        observed_treatment_effect_pa))

#MAR-20-PA
pa_j2r_mar_20_te <- mean(
  derive_treatment_rmse(pa_j2r_model_mar_20, 
                        observed_treatment_effect_pa))

#MAR-30-PA
pa_j2r_mar_30_te <- mean(
  derive_treatment_rmse(pa_j2r_model_mar_30, 
                        observed_treatment_effect_pa))

#MAR-40-PA
pa_j2r_mar_40_te <- mean(
  derive_treatment_rmse(pa_j2r_model_mar_40, 
                        observed_treatment_effect_pa))

#MNAR-20-PA
pa_j2r_mnar_20_te <- mean(
  derive_treatment_rmse(pa_j2r_model_mnar_20, 
                        observed_treatment_effect_pa))

#MNAR-30-PA
pa_j2r_mnar_30_te <- mean(
  derive_treatment_rmse(pa_j2r_model_mnar_30, 
                        observed_treatment_effect_pa))

#MNAR-40-PA
pa_j2r_mnar_40_te <- mean(
  derive_treatment_rmse(pa_j2r_model_mnar_40, 
                        observed_treatment_effect_pa))

## ---- evaluate-treatment-effect-MICE

#MCAR-20-SC
sc_mice_mcar_20_te <- mean(
  derive_treatment_rmse(sc_mice_model_mcar_20, 
                        observed_treatment_effect_sc))

#MCAR-30-SC
sc_mice_mcar_30_te <- mean(
  derive_treatment_rmse(sc_mice_model_mcar_30, 
                        observed_treatment_effect_sc))

#MCAR-40-SC
sc_mice_mcar_40_te <- mean(
  derive_treatment_rmse(sc_mice_model_mcar_40, 
                        observed_treatment_effect_sc))

#MAR-20-SC
sc_mice_mar_20_te <- mean(
  derive_treatment_rmse(sc_mice_model_mar_20, 
                        observed_treatment_effect_sc))

#MAR-30-SC
sc_mice_mar_30_te <- mean(
  derive_treatment_rmse(sc_mice_model_mar_30, 
                        observed_treatment_effect_sc))

#MAR-40-SC
sc_mice_mar_40_te <- mean(
  derive_treatment_rmse(sc_mice_model_mar_40, 
                        observed_treatment_effect_sc))

#MNAR-20-SC
sc_mice_mnar_20_te <- mean(
  derive_treatment_rmse(sc_mice_model_mnar_20, 
                        observed_treatment_effect_sc))

#MNAR-30-SC
sc_mice_mnar_30_te <- mean(
  derive_treatment_rmse(sc_mice_model_mnar_30, 
                        observed_treatment_effect_sc))

#MNAR-40-SC
sc_mice_mnar_40_te <- mean(
  derive_treatment_rmse(sc_mice_model_mnar_40, 
                        observed_treatment_effect_sc))

#MCAR-20-PA
pa_mice_mcar_20_te <- mean(
  derive_treatment_rmse(pa_mice_model_mcar_20, 
                        observed_treatment_effect_pa))

#MCAR-30-PA
pa_mice_mcar_30_te <- mean(
  derive_treatment_rmse(pa_mice_model_mcar_30, 
                        observed_treatment_effect_pa))

#MCAR-40-PA
pa_mice_mcar_40_te <- mean(
  derive_treatment_rmse(pa_mice_model_mcar_40, 
                        observed_treatment_effect_pa))

#MAR-20-PA
pa_mice_mar_20_te <- mean(
  derive_treatment_rmse(pa_mice_model_mar_20, 
                        observed_treatment_effect_pa))

#MAR-30-PA
pa_mice_mar_30_te <- mean(
  derive_treatment_rmse(pa_mice_model_mar_30, 
                        observed_treatment_effect_pa))

#MAR-40-PA
pa_mice_mar_40_te <- mean(
  derive_treatment_rmse(pa_mice_model_mar_40, 
                        observed_treatment_effect_pa))

#MNAR-20-PA
pa_mice_mnar_20_te <- mean(
  derive_treatment_rmse(pa_mice_model_mnar_20, 
                        observed_treatment_effect_pa))

#MNAR-30-PA
pa_mice_mnar_30_te <- mean(
  derive_treatment_rmse(pa_mice_model_mnar_30, 
                        observed_treatment_effect_pa))

#MNAR-40-PA
pa_mice_mnar_40_te <- mean(
  derive_treatment_rmse(pa_mice_model_mnar_40, 
                        observed_treatment_effect_pa))

## ---- evaluate-treatment-effect-LWD

#MCAR-20-SC
sc_lwd_mcar_20_te <- mean(
  derive_treatment_rmse(sc_lwd_model_mcar_20, 
                        observed_treatment_effect_sc))

#MCAR-30-SC
sc_lwd_mcar_30_te <- mean(
  derive_treatment_rmse(sc_lwd_model_mcar_30, 
                        observed_treatment_effect_sc))

#MCAR-40-SC
sc_lwd_mcar_40_te <- mean(
  derive_treatment_rmse(sc_lwd_model_mcar_40, 
                        observed_treatment_effect_sc))

#MAR-20-SC
sc_lwd_mar_20_te <- mean(
  derive_treatment_rmse(sc_lwd_model_mar_20, 
                        observed_treatment_effect_sc))

#MAR-30-SC
sc_lwd_mar_30_te <- mean(
  derive_treatment_rmse(sc_lwd_model_mar_30, 
                        observed_treatment_effect_sc))

#MAR-40-SC
sc_lwd_mar_40_te <- mean(
  derive_treatment_rmse(sc_lwd_model_mar_40, 
                        observed_treatment_effect_sc))

#MNAR-20-SC
sc_lwd_mnar_20_te <- mean(
  derive_treatment_rmse(sc_lwd_model_mnar_20, 
                        observed_treatment_effect_sc))

#MNAR-30-SC
sc_lwd_mnar_30_te <- mean(
  derive_treatment_rmse(sc_lwd_model_mnar_30, 
                        observed_treatment_effect_sc))

#MNAR-40-SC
sc_lwd_mnar_40_te <- mean(
  derive_treatment_rmse(sc_lwd_model_mnar_40, 
                        observed_treatment_effect_sc))

#MCAR-20-PA
pa_lwd_mcar_20_te <- mean(
  derive_treatment_rmse(pa_lwd_model_mcar_20, 
                        observed_treatment_effect_pa))

#MCAR-30-PA
pa_lwd_mcar_30_te <- mean(
  derive_treatment_rmse(pa_lwd_model_mcar_30, 
                        observed_treatment_effect_pa))

#MCAR-40-PA
pa_lwd_mcar_40_te <- mean(
  derive_treatment_rmse(pa_lwd_model_mcar_40, 
                        observed_treatment_effect_pa))

#MAR-20-PA
pa_lwd_mar_20_te <- mean(
  derive_treatment_rmse(pa_lwd_model_mar_20, 
                        observed_treatment_effect_pa))

#MAR-30-PA
pa_lwd_mar_30_te <- mean(
  derive_treatment_rmse(pa_lwd_model_mar_30, 
                        observed_treatment_effect_pa))

#MAR-40-PA
pa_lwd_mar_40_te <- mean(
  derive_treatment_rmse(pa_lwd_model_mar_40, 
                        observed_treatment_effect_pa))

#MNAR-20-PA
pa_lwd_mnar_20_te <- mean(
  derive_treatment_rmse(pa_lwd_model_mnar_20, 
                        observed_treatment_effect_pa))

#MNAR-30-PA
pa_lwd_mnar_30_te <- mean(
  derive_treatment_rmse(pa_lwd_model_mnar_30, 
                        observed_treatment_effect_pa))

#MNAR-40-PA
pa_lwd_mnar_40_te <- mean(
  derive_treatment_rmse(pa_lwd_model_mnar_40, 
                        observed_treatment_effect_pa))

## ---- evaluate-treatment-effect-LOCF

#MCAR-20-SC
sc_locf_mcar_20_te <- mean(
  derive_treatment_rmse(sc_locf_model_mcar_20, 
                        observed_treatment_effect_sc))

#MCAR-30-SC
sc_locf_mcar_30_te <- mean(
  derive_treatment_rmse(sc_locf_model_mcar_30, 
                        observed_treatment_effect_sc))

#MCAR-40-SC
sc_locf_mcar_40_te <- mean(
  derive_treatment_rmse(sc_locf_model_mcar_40, 
                        observed_treatment_effect_sc))

#MAR-20-SC
sc_locf_mar_20_te <- mean(
  derive_treatment_rmse(sc_locf_model_mar_20, 
                        observed_treatment_effect_sc))

#MAR-30-SC
sc_locf_mar_30_te <- mean(
  derive_treatment_rmse(sc_locf_model_mar_30, 
                        observed_treatment_effect_sc))

#MAR-40-SC
sc_locf_mar_40_te <- mean(
  derive_treatment_rmse(sc_locf_model_mar_40, 
                        observed_treatment_effect_sc))

#MNAR-20-SC
sc_locf_mnar_20_te <- mean(
  derive_treatment_rmse(sc_locf_model_mnar_20, 
                        observed_treatment_effect_sc))

#MNAR-30-SC
sc_locf_mnar_30_te <- mean(
  derive_treatment_rmse(sc_locf_model_mnar_30, 
                        observed_treatment_effect_sc))

#MNAR-40-SC
sc_locf_mnar_40_te <- mean(
  derive_treatment_rmse(sc_locf_model_mnar_40, 
                        observed_treatment_effect_sc))

#MCAR-20-PA
pa_locf_mcar_20_te <- mean(
  derive_treatment_rmse(pa_locf_model_mcar_20, 
                        observed_treatment_effect_pa))

#MCAR-30-PA
pa_locf_mcar_30_te <- mean(
  derive_treatment_rmse(pa_locf_model_mcar_30, 
                        observed_treatment_effect_pa))

#MCAR-40-PA
pa_locf_mcar_40_te <- mean(
  derive_treatment_rmse(pa_locf_model_mcar_40, 
                        observed_treatment_effect_pa))

#MAR-20-PA
pa_locf_mar_20_te <- mean(
  derive_treatment_rmse(pa_locf_model_mar_20, 
                        observed_treatment_effect_pa))

#MAR-30-PA
pa_locf_mar_30_te <- mean(
  derive_treatment_rmse(pa_locf_model_mar_30, 
                        observed_treatment_effect_pa))

#MAR-40-PA
pa_locf_mar_40_te <- mean(
  derive_treatment_rmse(pa_locf_model_mar_40, 
                        observed_treatment_effect_pa))

#MNAR-20-PA
pa_locf_mnar_20_te <- mean(
  derive_treatment_rmse(pa_locf_model_mnar_20, 
                        observed_treatment_effect_pa))

#MNAR-30-PA
pa_locf_mnar_30_te <- mean(
  derive_treatment_rmse(pa_locf_model_mnar_30, 
                        observed_treatment_effect_pa))

#MNAR-40-PA
pa_locf_mnar_40_te <- mean(
  derive_treatment_rmse(pa_locf_model_mnar_40, 
                        observed_treatment_effect_pa))