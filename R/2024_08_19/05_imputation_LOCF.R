## ---- impute-locf

post_locf <- impute_locf_dataset(data = synthetic_data_missing, 
                                 var_list = c("selfcare", 
                                              "physical_activity"))
