## ---- evaluate-J2R-treatment

j2r_rmse_sc <- sqrt(mean((
  rep(observed_treatment_effect_sc, length(j2r_treatment_effect_sc)) - 
    j2r_treatment_effect_sc)^2))

j2r_rmse_pa <- sqrt(mean((
  rep(observed_treatment_effect_pa, length(j2r_treatment_effect_pa)) - 
    j2r_treatment_effect_pa)^2))

## ---- evaluate-MICE-treatment

mice_rmse_sc <- sqrt(mean((
  rep(observed_treatment_effect_sc, length(mice_treatment_effect_sc)) - 
    mice_treatment_effect_sc)^2))

mice_rmse_pa <- sqrt(mean((
  rep(observed_treatment_effect_pa, length(mice_treatment_effect_pa)) - 
    mice_treatment_effect_pa)^2))

## ---- evaluate-LOCF-treatment

locf_rmse_sc <- sqrt(mean((
  rep(observed_treatment_effect_sc, length(locf_treatment_effect_sc)) - 
    locf_treatment_effect_sc)^2))

locf_rmse_pa <- sqrt(mean((
  rep(observed_treatment_effect_pa, length(locf_treatment_effect_pa)) - 
    locf_treatment_effect_pa)^2))

## ---- evaluate-LWD-treatment

lwd_rmse_sc <- sqrt(mean((
  rep(observed_treatment_effect_sc, length(lwd_treatment_effect_sc)) - 
    lwd_treatment_effect_sc)^2))

lwd_rmse_pa <- sqrt(mean((
  rep(observed_treatment_effect_pa, length(lwd_treatment_effect_pa)) - 
    lwd_treatment_effect_pa)^2))