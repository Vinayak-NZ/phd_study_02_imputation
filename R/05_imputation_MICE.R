## ---- selfcare-MICE

#MCAR-20

sc_mice_mcar_20 <- simulate_mice_bulk(input = sc_missing_mcar_20, 
                                           var = "selfcare", 
                                           imp_iterations = 20)

#MCAR-30

sc_mice_mcar_30 <- simulate_mice_bulk(input = sc_missing_mcar_30, 
                                      var = "selfcare", 
                                      imp_iterations = 20)

#MCAR-40

sc_mice_mcar_40 <- simulate_mice_bulk(input = sc_missing_mcar_40, 
                                      var = "selfcare", 
                                      imp_iterations = 20)

#MAR-20

sc_mice_mar_20 <- simulate_mice_bulk(input = sc_missing_mar_20, 
                                      var = "selfcare", 
                                      imp_iterations = 20)

#MAR-30

sc_mice_mar_30 <- simulate_mice_bulk(input = sc_missing_mar_30, 
                                      var = "selfcare", 
                                      imp_iterations = 20)

#MAR-40

sc_mice_mar_40 <- simulate_mice_bulk(input = sc_missing_mar_40, 
                                      var = "selfcare", 
                                      imp_iterations = 20)

#MNAR-20

sc_mice_mnar_20 <- simulate_mice_bulk(input = sc_missing_mnar_20, 
                                     var = "selfcare", 
                                     imp_iterations = 20)

#MNAR-30

sc_mice_mnar_30 <- simulate_mice_bulk(input = sc_missing_mnar_30, 
                                     var = "selfcare", 
                                     imp_iterations = 20)

#MNAR-40

sc_mice_mnar_40 <- simulate_mice_bulk(input = sc_missing_mnar_40, 
                                     var = "selfcare", 
                                     imp_iterations = 20)

## ---- physical-activity-MICE

#MCAR-20

pa_mice_mcar_20 <- simulate_mice_bulk(input = pa_missing_mcar_20, 
                                      var = "physical_activity", 
                                      imp_iterations = 20)

#MCAR-30

pa_mice_mcar_30 <- simulate_mice_bulk(input = pa_missing_mcar_30, 
                                      var = "physical_activity", 
                                      imp_iterations = 20)

#MCAR-40

pa_mice_mcar_40 <- simulate_mice_bulk(input = pa_missing_mcar_40, 
                                      var = "physical_activity", 
                                      imp_iterations = 20)

#MAR-20

pa_mice_mar_20 <- simulate_mice_bulk(input = pa_missing_mar_20, 
                                     var = "physical_activity", 
                                     imp_iterations = 20)

#MAR-30

pa_mice_mar_30 <- simulate_mice_bulk(input = pa_missing_mar_30, 
                                     var = "physical_activity", 
                                     imp_iterations = 20)

#MAR-40

pa_mice_mar_40 <- simulate_mice_bulk(input = pa_missing_mar_40, 
                                     var = "physical_activity", 
                                     imp_iterations = 20)

#MNAR-20

pa_mice_mnar_20 <- simulate_mice_bulk(input = pa_missing_mnar_20, 
                                      var = "physical_activity", 
                                      imp_iterations = 20)

#MNAR-30

pa_mice_mnar_30 <- simulate_mice_bulk(input = pa_missing_mnar_30, 
                                      var = "physical_activity", 
                                      imp_iterations = 20)

#MNAR-40

pa_mice_mnar_40 <- simulate_mice_bulk(input = pa_missing_mnar_40, 
                                      var = "physical_activity", 
                                      imp_iterations = 20)