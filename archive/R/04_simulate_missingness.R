## ---- simulate-missingness

synthetic_data_missing <- simulate_missing(input = synthetic_data_subset, 
                              n = 20, 
                              var_list = c("ipaq_sit", 
                                           "ipaq_walking", 
                                           "ipaq_moderate", 
                                           "ipaq_vigorous"))
