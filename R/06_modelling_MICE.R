## ---- selfcare-MICE-modelling

#MCAR-20
sc_mice_model_mcar_20 <- model_mice_bulk(input = sc_mice_mcar_20, 
                                      var = "selfcare", 
                                      uprange = 100)

#MCAR-30
sc_mice_model_mcar_30 <- model_mice_bulk(input = sc_mice_mcar_30, 
                                         var = "selfcare", 
                                         uprange = 100)

#MCAR-40
sc_mice_model_mcar_40 <- model_mice_bulk(input = sc_mice_mcar_40, 
                                         var = "selfcare", 
                                         uprange = 100)

#MAR-20
sc_mice_model_mar_20 <- model_mice_bulk(input = sc_mice_mar_20, 
                                         var = "selfcare", 
                                         uprange = 100)

#MAR-30
sc_mice_model_mar_30 <- model_mice_bulk(input = sc_mice_mar_30, 
                                         var = "selfcare", 
                                         uprange = 100)

#MAR-40
sc_mice_model_mar_40 <- model_mice_bulk(input = sc_mice_mar_40, 
                                         var = "selfcare", 
                                         uprange = 100)

#MAR-20
sc_mice_model_mnar_20 <- model_mice_bulk(input = sc_mice_mnar_20, 
                                        var = "selfcare", 
                                        uprange = 100)

#MAR-30
sc_mice_model_mnar_30 <- model_mice_bulk(input = sc_mice_mnar_30, 
                                        var = "selfcare", 
                                        uprange = 100)

#MAR-40
sc_mice_model_mnar_40 <- model_mice_bulk(input = sc_mice_mnar_40, 
                                        var = "selfcare", 
                                        uprange = 100)

## ---- physical-activity-MICE-modelling

#MCAR-20
pa_mice_model_mcar_20 <- model_mice_bulk(input = pa_mice_mcar_20, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MCAR-30
pa_mice_model_mcar_30 <- model_mice_bulk(input = pa_mice_mcar_30, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MCAR-40
pa_mice_model_mcar_40 <- model_mice_bulk(input = pa_mice_mcar_40, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MAR-20
pa_mice_model_mar_20 <- model_mice_bulk(input = pa_mice_mar_20, 
                                        var = "physical_activity", 
                                        uprange = 20000)

#MAR-30
pa_mice_model_mar_30 <- model_mice_bulk(input = pa_mice_mar_30, 
                                        var = "physical_activity", 
                                        uprange = 20000)

#MAR-40
pa_mice_model_mar_40 <- model_mice_bulk(input = pa_mice_mar_40, 
                                        var = "physical_activity", 
                                        uprange = 20000)

#MAR-20
pa_mice_model_mnar_20 <- model_mice_bulk(input = pa_mice_mnar_20, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MAR-30
pa_mice_model_mnar_30 <- model_mice_bulk(input = pa_mice_mnar_30, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MAR-40
pa_mice_model_mnar_40 <- model_mice_bulk(input = pa_mice_mnar_40, 
                                         var = "physical_activity", 
                                         uprange = 20000)