## ---- simulate-missingness

synthetic_data_missing <- simulate_missing(input = synthetic_data_subset, 
                                           n = 20, 
                                           var_list = c("selfcare", 
                                                        "physical_activity"))

synthetic_data_missing_eval <- synthetic_data_missing
