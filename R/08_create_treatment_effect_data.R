## ---- create-treatment-effects-data-set-selfcare

# self-care-mcar-20

data_estimates_sc_mcar_20 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(sc_effect_mice_mcar_20, 
                                sc_effect_j2r_mcar_20, 
                                sc_effect_locf_mcar_20, 
                                sc_effect_lwd_mcar_20),
             lower = c(sc_se_mice_mcar_20[[1]], 
                       sc_se_j2r_mcar_20[[1]], 
                       sc_se_locf_mcar_20[[1]], 
                       sc_se_lwd_mcar_20[[1]]),
             upper = c(sc_se_mice_mcar_20[[2]], 
                       sc_se_j2r_mcar_20[[2]], 
                       sc_se_locf_mcar_20[[2]], 
                       sc_se_lwd_mcar_20[[2]]))

# self-care-mcar-30

data_estimates_sc_mcar_30 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(sc_effect_mice_mcar_30, 
                                sc_effect_j2r_mcar_30, 
                                sc_effect_locf_mcar_30, 
                                sc_effect_lwd_mcar_30),
             lower = c(sc_se_mice_mcar_30[[1]], 
                       sc_se_j2r_mcar_30[[1]], 
                       sc_se_locf_mcar_30[[1]], 
                       sc_se_lwd_mcar_30[[1]]),
             upper = c(sc_se_mice_mcar_30[[2]], 
                       sc_se_j2r_mcar_30[[2]], 
                       sc_se_locf_mcar_30[[2]], 
                       sc_se_lwd_mcar_30[[2]]))

# self-care-mcar-40

data_estimates_sc_mcar_40 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(sc_effect_mice_mcar_40, 
                                sc_effect_j2r_mcar_40, 
                                sc_effect_locf_mcar_40, 
                                sc_effect_lwd_mcar_40),
             lower = c(sc_se_mice_mcar_40[[1]], 
                       sc_se_j2r_mcar_40[[1]], 
                       sc_se_locf_mcar_40[[1]], 
                       sc_se_lwd_mcar_40[[1]]),
             upper = c(sc_se_mice_mcar_40[[2]], 
                       sc_se_j2r_mcar_40[[2]], 
                       sc_se_locf_mcar_40[[2]], 
                       sc_se_lwd_mcar_40[[2]]))

# self-care-mar-20

data_estimates_sc_mar_20 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(sc_effect_mice_mar_20, 
                                sc_effect_j2r_mar_20, 
                                sc_effect_locf_mar_20, 
                                sc_effect_lwd_mar_20),
             lower = c(sc_se_mice_mar_20[[1]], 
                       sc_se_j2r_mar_20[[1]], 
                       sc_se_locf_mar_20[[1]], 
                       sc_se_lwd_mar_20[[1]]),
             upper = c(sc_se_mice_mar_20[[2]], 
                       sc_se_j2r_mar_20[[2]], 
                       sc_se_locf_mar_20[[2]], 
                       sc_se_lwd_mar_20[[2]]))

# self-care-mar-30

data_estimates_sc_mar_30 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(sc_effect_mice_mar_30, 
                                sc_effect_j2r_mar_30, 
                                sc_effect_locf_mar_30, 
                                sc_effect_lwd_mar_30),
             lower = c(sc_se_mice_mar_30[[1]], 
                       sc_se_j2r_mar_30[[1]], 
                       sc_se_locf_mar_30[[1]], 
                       sc_se_lwd_mar_30[[1]]),
             upper = c(sc_se_mice_mar_30[[2]], 
                       sc_se_j2r_mar_30[[2]], 
                       sc_se_locf_mar_30[[2]], 
                       sc_se_lwd_mar_30[[2]]))

# self-care-mar-40

data_estimates_sc_mar_40 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(sc_effect_mice_mar_40, 
                                sc_effect_j2r_mar_40, 
                                sc_effect_locf_mar_40, 
                                sc_effect_lwd_mar_40),
             lower = c(sc_se_mice_mar_40[[1]], 
                       sc_se_j2r_mar_40[[1]], 
                       sc_se_locf_mar_40[[1]], 
                       sc_se_lwd_mar_40[[1]]),
             upper = c(sc_se_mice_mar_40[[2]], 
                       sc_se_j2r_mar_40[[2]], 
                       sc_se_locf_mar_40[[2]], 
                       sc_se_lwd_mar_40[[2]]))

# self-care-mnar-20

data_estimates_sc_mnar_20 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(sc_effect_mice_mnar_20, 
                                sc_effect_j2r_mnar_20, 
                                sc_effect_locf_mnar_20, 
                                sc_effect_lwd_mnar_20),
             lower = c(sc_se_mice_mnar_20[[1]], 
                       sc_se_j2r_mnar_20[[1]], 
                       sc_se_locf_mnar_20[[1]], 
                       sc_se_lwd_mnar_20[[1]]),
             upper = c(sc_se_mice_mnar_20[[2]], 
                       sc_se_j2r_mnar_20[[2]], 
                       sc_se_locf_mnar_20[[2]], 
                       sc_se_lwd_mnar_20[[2]]))

# self-care-mnar-30

data_estimates_sc_mnar_30 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(sc_effect_mice_mnar_30, 
                                sc_effect_j2r_mnar_30, 
                                sc_effect_locf_mnar_30, 
                                sc_effect_lwd_mnar_30),
             lower = c(sc_se_mice_mnar_30[[1]], 
                       sc_se_j2r_mnar_30[[1]], 
                       sc_se_locf_mnar_30[[1]], 
                       sc_se_lwd_mnar_30[[1]]),
             upper = c(sc_se_mice_mnar_30[[2]], 
                       sc_se_j2r_mnar_30[[2]], 
                       sc_se_locf_mnar_30[[2]], 
                       sc_se_lwd_mnar_30[[2]]))

# self-care-mnar-40

data_estimates_sc_mnar_40 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(sc_effect_mice_mnar_40, 
                                sc_effect_j2r_mnar_40, 
                                sc_effect_locf_mnar_40, 
                                sc_effect_lwd_mnar_40),
             lower = c(sc_se_mice_mnar_40[[1]], 
                       sc_se_j2r_mnar_40[[1]], 
                       sc_se_locf_mnar_40[[1]], 
                       sc_se_lwd_mnar_40[[1]]),
             upper = c(sc_se_mice_mnar_40[[2]], 
                       sc_se_j2r_mnar_40[[2]], 
                       sc_se_locf_mnar_40[[2]], 
                       sc_se_lwd_mnar_40[[2]]))

## ---- create-treatment-effects-data-set-physical-activity

# physical-activity-mcar-20

data_estimates_pa_mcar_20 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(pa_effect_mice_mcar_20, 
                                pa_effect_j2r_mcar_20, 
                                pa_effect_locf_mcar_20, 
                                pa_effect_lwd_mcar_20),
             lower = c(pa_se_mice_mcar_20[[1]], 
                       pa_se_j2r_mcar_20[[1]], 
                       pa_se_locf_mcar_20[[1]], 
                       pa_se_lwd_mcar_20[[1]]),
             upper = c(pa_se_mice_mcar_20[[2]], 
                       pa_se_j2r_mcar_20[[2]], 
                       pa_se_locf_mcar_20[[2]], 
                       pa_se_lwd_mcar_20[[2]]))

# physical-activity-mcar-30

data_estimates_pa_mcar_30 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(pa_effect_mice_mcar_30, 
                                pa_effect_j2r_mcar_30, 
                                pa_effect_locf_mcar_30, 
                                NA),
             lower = c(pa_se_mice_mcar_30[[1]], 
                       pa_se_j2r_mcar_30[[1]], 
                       pa_se_locf_mcar_30[[1]], 
                       NA),
             upper = c(pa_se_mice_mcar_30[[2]], 
                       pa_se_j2r_mcar_30[[2]], 
                       pa_se_locf_mcar_30[[2]], 
                       NA))

# physical-activity-mcar-40

data_estimates_pa_mcar_40 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(pa_effect_mice_mcar_40, 
                                pa_effect_j2r_mcar_40, 
                                pa_effect_locf_mcar_40, 
                                NA),
             lower = c(pa_se_mice_mcar_40[[1]], 
                       pa_se_j2r_mcar_40[[1]], 
                       pa_se_locf_mcar_40[[1]], 
                       NA),
             upper = c(pa_se_mice_mcar_40[[2]], 
                       pa_se_j2r_mcar_40[[2]], 
                       pa_se_locf_mcar_40[[2]], 
                       NA))

# physical-activity-mar-20

data_estimates_pa_mar_20 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(pa_effect_mice_mar_20, 
                                pa_effect_j2r_mar_20, 
                                pa_effect_locf_mar_20, 
                                pa_effect_lwd_mar_20),
             lower = c(pa_se_mice_mar_20[[1]], 
                       pa_se_j2r_mar_20[[1]], 
                       pa_se_locf_mar_20[[1]], 
                       pa_se_lwd_mar_20[[1]]),
             upper = c(pa_se_mice_mar_20[[2]], 
                       pa_se_j2r_mar_20[[2]], 
                       pa_se_locf_mar_20[[2]], 
                       pa_se_lwd_mar_20[[2]]))

# physical-activity-mar-30

data_estimates_pa_mar_30 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(pa_effect_mice_mar_30, 
                                pa_effect_j2r_mar_30, 
                                pa_effect_locf_mar_30, 
                                NA),
             lower = c(pa_se_mice_mar_30[[1]], 
                       pa_se_j2r_mar_30[[1]], 
                       pa_se_locf_mar_30[[1]], 
                       NA),
             upper = c(pa_se_mice_mar_30[[2]], 
                       pa_se_j2r_mar_30[[2]], 
                       pa_se_locf_mar_30[[2]], 
                       NA))

# physical-activity-mar-40

data_estimates_pa_mar_40 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(pa_effect_mice_mar_40, 
                                pa_effect_j2r_mar_40, 
                                pa_effect_locf_mar_40, 
                                NA),
             lower = c(pa_se_mice_mar_40[[1]], 
                       pa_se_j2r_mar_40[[1]], 
                       pa_se_locf_mar_40[[1]], 
                       NA),
             upper = c(pa_se_mice_mar_40[[2]], 
                       pa_se_j2r_mar_40[[2]], 
                       pa_se_locf_mar_40[[2]], 
                       NA))

# physical-activity-mnar-20

data_estimates_pa_mnar_20 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(pa_effect_mice_mnar_20, 
                                pa_effect_j2r_mnar_20, 
                                pa_effect_locf_mnar_20, 
                                NA),
             lower = c(pa_se_mice_mnar_20[[1]], 
                       pa_se_j2r_mnar_20[[1]], 
                       pa_se_locf_mnar_20[[1]], 
                       NA),
             upper = c(pa_se_mice_mnar_20[[2]], 
                       pa_se_j2r_mnar_20[[2]], 
                       pa_se_locf_mnar_20[[2]], 
                       NA))

# physical-activity-mnar-30

data_estimates_pa_mnar_30 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(pa_effect_mice_mnar_30, 
                                pa_effect_j2r_mnar_30, 
                                pa_effect_locf_mnar_30, 
                                NA),
             lower = c(pa_se_mice_mnar_30[[1]], 
                       pa_se_j2r_mnar_30[[1]], 
                       pa_se_locf_mnar_30[[1]], 
                       NA),
             upper = c(pa_se_mice_mnar_30[[2]], 
                       pa_se_j2r_mnar_30[[2]], 
                       pa_se_locf_mnar_30[[2]], 
                       NA))

# physical-activity-mnar-40

data_estimates_pa_mnar_40 <- 
  data.frame(source = c("MICE", "J2R", "LOCF", "LWD"), 
             point_estimate = c(pa_effect_mice_mnar_40, 
                                pa_effect_j2r_mnar_40, 
                                pa_effect_locf_mnar_40, 
                                NA),
             lower = c(pa_se_mice_mnar_40[[1]], 
                       pa_se_j2r_mnar_40[[1]], 
                       pa_se_locf_mnar_40[[1]], 
                       NA),
             upper = c(pa_se_mice_mnar_40[[2]], 
                       pa_se_j2r_mnar_40[[2]], 
                       pa_se_locf_mnar_40[[2]], 
                       NA))