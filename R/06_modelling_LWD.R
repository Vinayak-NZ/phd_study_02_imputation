## ---- selfcare-LOCF-modelling

#MCAR-20
sc_lwd_model_mcar_20 <- model_lwd_bulk(input = sc_missing_mcar_20, 
                                         var = "selfcare")

#MCAR-30
sc_lwd_model_mcar_30 <- model_lwd_bulk(input = sc_missing_mcar_30, 
                                         var = "selfcare")

#MCAR-40
sc_lwd_model_mcar_40 <- model_lwd_bulk(input = sc_missing_mcar_40, 
                                         var = "selfcare")

#MAR-20
sc_lwd_model_mar_20 <- model_lwd_bulk(input = sc_missing_mar_20, 
                                        var = "selfcare")

#MAR-30
sc_lwd_model_mar_30 <- model_lwd_bulk(input = sc_missing_mar_30, 
                                        var = "selfcare")

#MAR-40
sc_lwd_model_mar_40 <- model_lwd_bulk(input = sc_missing_mar_40, 
                                        var = "selfcare")

#MAR-20
sc_lwd_model_mnar_20 <- model_lwd_bulk(input = sc_missing_mnar_20, 
                                         var = "selfcare")

#MAR-30
sc_lwd_model_mnar_30 <- model_lwd_bulk(input = sc_missing_mnar_30, 
                                         var = "selfcare")

#MAR-40
sc_lwd_model_mnar_40 <- model_lwd_bulk(input = sc_missing_mnar_40, 
                                         var = "selfcare")

## ---- physical-activity-LOCF-modelling

#MCAR-20
pa_lwd_model_mcar_20 <- model_lwd_bulk(input = pa_missing_mcar_20, 
                                         var = "physical_activity")

#MCAR-30
pa_lwd_model_mcar_30 <- model_lwd_bulk(input = pa_missing_mcar_30, 
                                         var = "physical_activity")

#MCAR-40
pa_lwd_model_mcar_40 <- model_lwd_bulk(input = pa_missing_mcar_40, 
                                         var = "physical_activity")

#MAR-20
pa_lwd_model_mar_20 <- model_lwd_bulk(input = pa_missing_mar_20, 
                                        var = "physical_activity")

#MAR-30
pa_lwd_model_mar_30 <- model_lwd_bulk(input = pa_missing_mar_30, 
                                        var = "physical_activity")

#MAR-40
pa_lwd_model_mar_40 <- model_lwd_bulk(input = pa_missing_mar_40, 
                                        var = "physical_activity")

#MAR-20
pa_lwd_model_mnar_20 <- model_lwd_bulk(input = pa_missing_mnar_20, 
                                         var = "physical_activity")

#MAR-30
pa_lwd_model_mnar_30 <- model_lwd_bulk(input = pa_missing_mnar_30, 
                                         var = "physical_activity")

#MAR-40
pa_lwd_model_mnar_40 <- model_lwd_bulk(input = pa_missing_mnar_40, 
                                         var = "physical_activity")