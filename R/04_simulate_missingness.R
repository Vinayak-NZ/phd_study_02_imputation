## ---- selfcare-missingness

#MCAR-20

sc_missing_mcar_20 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                             var = "selfcare", 
                                             proportion = 0.2,
                                             miss_mech = "MCAR",
                                             iterations = 100)

#MCAR-30

sc_missing_mcar_30 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                             var = "selfcare", 
                                             proportion = 0.3,
                                             miss_mech = "MCAR",
                                             iterations = 100)

#MCAR-40

sc_missing_mcar_40 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "selfcare", 
                                                proportion = 0.4,
                                                miss_mech = "MCAR",
                                                iterations = 100)

#MAR-20

sc_missing_mar_20 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "selfcare", 
                                                proportion = 0.2,
                                                miss_mech = "MAR",
                                                iterations = 100)

#MAR-30

sc_missing_mar_30 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "selfcare", 
                                                proportion = 0.3,
                                                miss_mech = "MAR",
                                                iterations = 100)

#MAR-40

sc_missing_mar_40 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "selfcare", 
                                                proportion = 0.4,
                                                miss_mech = "MAR",
                                                iterations = 100)

#MNAR-20

sc_missing_mnar_20 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "selfcare", 
                                                proportion = 0.2,
                                                miss_mech = "MNAR",
                                                iterations = 100)

#MNAR-30

sc_missing_mnar_30 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "selfcare", 
                                                proportion = 0.3,
                                                miss_mech = "MNAR",
                                                iterations = 100)

#MNAR-40

sc_missing_mnar_40 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "selfcare", 
                                                proportion = 0.4,
                                                miss_mech = "MNAR",
                                                iterations = 100)

## ---- physical-activity-missingness

#MCAR-20

pa_missing_mcar_20 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "physical_activity", 
                                                proportion = 0.2,
                                                miss_mech = "MCAR",
                                                iterations = 100)

#MCAR-30

pa_missing_mcar_30 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "physical_activity", 
                                                proportion = 0.3,
                                                miss_mech = "MCAR",
                                                iterations = 100)

#MCAR-40

pa_missing_mcar_40 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "physical_activity", 
                                                proportion = 0.4,
                                                miss_mech = "MCAR",
                                                iterations = 100)

#MAR-20

pa_missing_mar_20 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "physical_activity", 
                                                proportion = 0.2,
                                                miss_mech = "MAR",
                                                iterations = 100)

#MAR-30

pa_missing_mar_30 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "physical_activity", 
                                                proportion = 0.3,
                                                miss_mech = "MAR",
                                                iterations = 100)

#MAR-40

pa_missing_mar_40 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                                var = "physical_activity", 
                                                proportion = 0.4,
                                                miss_mech = "MAR",
                                                iterations = 100)

#MNAR-20

pa_missing_mnar_20 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                               var = "physical_activity", 
                                               proportion = 0.2,
                                               miss_mech = "MNAR",
                                               iterations = 100)

#MNAR-30

pa_missing_mnar_30 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                               var = "physical_activity", 
                                               proportion = 0.3,
                                               miss_mech = "MNAR",
                                               iterations = 100)

#MNAR-40

pa_missing_mnar_40 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                               var = "physical_activity", 
                                               proportion = 0.4,
                                               miss_mech = "MNAR",
                                               iterations = 100)
