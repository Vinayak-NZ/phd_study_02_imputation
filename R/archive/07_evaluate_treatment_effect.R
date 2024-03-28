## ---- evaluate-J2R

# self-care
median(models_rmse_vector_sc)

# physical-activity
median(models_rmse_vector_pa)

## ---- evaluate-MICE

# self-care
median(mice_models_rmse_vector_sc)

# physical-activity
median(mice_models_rmse_vector_pa)

## ---- evaluate-LOCF

# self-care
RMSE.merMod(locf_model_sc)

# physical-activity
RMSE.merMod(locf_model_pa)

## ---- evaluate-LWD

# self-care
RMSE.merMod(lwd_model_sc)

# physical-activity
RMSE.merMod(lwd_model_pa)
