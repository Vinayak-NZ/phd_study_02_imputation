## ---- impute-locf
post_locf <- impute_locf_dataset(data = synthetic_data_missing, var_list = c("ipaq_sit", 
                                                                "ipaq_walking", 
                                                                "ipaq_moderate", 
                                                                "ipaq_vigorous"))