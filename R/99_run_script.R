## ---- core-code

source("R/00_load_functions.R")
source("R/00_load_package.R")
source("R/01_load_data.R")
source("R/02_data_edit.R")
source("R/03_create_synthetic_data.R")
source("R/04_simulate_missingness.R")
source("R/06_modelling_observed.R")

## ---- J2R

source("R/05_imputation_J2R.R")
source("R/06_modelling_J2R.R")

## ---- LOCF

source("R/05_imputation_LOCF.R")
source("R/06_modelling_LOCF.R")

## ---- MICE

source("R/05_imputation_MICE.R")
source("R/06_modelling_MICE.R")

## ---- list-wise-deletion
source("R/06_modelling_LWD.R")

## ---- evaluate

source("R/07_evaluate_unit_record_level.R")
source("R/07_evaluate_treatment_effect.R")

## ---- visualise-basics

source("R/01_load_data.R")
source("R/02_data_edit.R")
source("R/03_create_synthetic_data.R")
source("R/04_simulate_missingness.R")
source("R/08_visualise_socio_demographics.R")
source("R/08_visualise_missingness.R")
source("R/08_visualise_data_comparisons.R")

## ---- visualise-estimates
source("R/08_pool_effects_J2R.R")
source("R/08_pool_effects_LOCF.R")
source("R/08_pool_effects_LWD.R")
source("R/08_pool_effects_MICE.R")
source("R/08_create_treatment_effect_data.R")
source("R/09_visualise_estimates.R")
source("R/10_arrange_estimate_plots.R")
