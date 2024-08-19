## ---- selfcare-J2R-modelling

#MCAR-20
sc_j2r_model_mcar_20 <- model_j2r_bulk(input = sc_j2r_mcar_20, 
                                         var = "selfcare", 
                                         uprange = 100)

#MCAR-30
sc_j2r_model_mcar_30 <- model_j2r_bulk(input = sc_j2r_mcar_30, 
                                         var = "selfcare", 
                                         uprange = 100)

#MCAR-40
sc_j2r_model_mcar_40 <- model_j2r_bulk(input = sc_j2r_mcar_40, 
                                         var = "selfcare", 
                                         uprange = 100)

#MAR-20
sc_j2r_model_mar_20 <- model_j2r_bulk(input = sc_j2r_mar_20, 
                                        var = "selfcare", 
                                        uprange = 100)

#MAR-30
sc_j2r_model_mar_30 <- model_j2r_bulk(input = sc_j2r_mar_30, 
                                        var = "selfcare", 
                                        uprange = 100)

#MAR-40
sc_j2r_model_mar_40 <- model_j2r_bulk(input = sc_j2r_mar_40, 
                                        var = "selfcare", 
                                        uprange = 100)

#MAR-20
sc_j2r_model_mnar_20 <- model_j2r_bulk(input = sc_j2r_mnar_20, 
                                         var = "selfcare", 
                                         uprange = 100)

#MAR-30
sc_j2r_model_mnar_30 <- model_j2r_bulk(input = sc_j2r_mnar_30, 
                                         var = "selfcare", 
                                         uprange = 100)

#MAR-40
sc_j2r_model_mnar_40 <- model_j2r_bulk(input = sc_j2r_mnar_40, 
                                         var = "selfcare", 
                                         uprange = 100)

## ---- physical-activity-J2R-modelling

#MCAR-20
pa_j2r_model_mcar_20 <- model_j2r_bulk(input = pa_j2r_mcar_20, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MCAR-30
pa_j2r_model_mcar_30 <- model_j2r_bulk(input = pa_j2r_mcar_30, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MCAR-40
pa_j2r_model_mcar_40 <- model_j2r_bulk(input = pa_j2r_mcar_40, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MAR-20
pa_j2r_model_mar_20 <- model_j2r_bulk(input = pa_j2r_mar_20, 
                                        var = "physical_activity", 
                                        uprange = 20000)

#MAR-30
pa_j2r_model_mar_30 <- model_j2r_bulk(input = pa_j2r_mar_30, 
                                        var = "physical_activity", 
                                        uprange = 20000)

#MAR-40
pa_j2r_model_mar_40 <- model_j2r_bulk(input = pa_j2r_mar_40, 
                                        var = "physical_activity", 
                                        uprange = 20000)

#MAR-20
pa_j2r_model_mnar_20 <- model_j2r_bulk(input = pa_j2r_mnar_20, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MAR-30
pa_j2r_model_mnar_30 <- model_j2r_bulk(input = pa_j2r_mnar_30, 
                                         var = "physical_activity", 
                                         uprange = 20000)

#MAR-40
pa_j2r_model_mnar_40 <- model_j2r_bulk(input = pa_j2r_mnar_40, 
                                         var = "physical_activity", 
                                         uprange = 20000)