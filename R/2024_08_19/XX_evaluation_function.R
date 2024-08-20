
## ---- evaluate-unit-record-data
evaluate_unit_record_rmse <- function(observed_data, predicted_data, observed_var, predicted_var){
  
  observed_data[["unique_id"]] <- c(1:226)
  
  predicted_data <- predicted_data[, c("unique_id", predicted_var)]
  
  names(predicted_data)[names(predicted_data) == predicted_var] <- "predicted"
  
  observed_data <- observed_data[, c("unique_id", observed_var)]
  
  names(observed_data)[names(observed_data) == observed_var] <- "observed"
  
  data_eval <- merge(predicted_data, observed_data, by = "unique_id")
  
  data_eval$difference <- (data_eval$predicted - data_eval$observed)^2
  
  rmse <- sqrt(sum(data_eval$difference, na.rm = TRUE)/nrow(data_eval))
  
  return(rmse)
  
}

## ---- evaluate-unit-record-data-bulk
evaluate_unit_record_rmse_bulk <- function(observed_data, input, observed_var, predicted_var, method){
  
  if(method == "MICE"){
    
    input <- create_single_mice_bulk(input = input, 
                                    var = substr(observed_var, 1, nchar(observed_var)-4), 
                                    imp_iterations = 20)
    
  }else if(method == "J2R"){
    
    input <- create_single_j2r_bulk(input = input, 
                                    var = substr(observed_var, 1, nchar(observed_var)-4), 
                                    imp_iterations = 20)
    
  }else if(method == "LOCF"){
    
    input <- input
    
  }
  
  output <- c()
  
  for (sim in 1:length(input)){
    
    predicted_data <- input[[sim]]
    
    rmse_unit_record <- evaluate_unit_record_rmse(observed_data = observed_data, 
                                                  predicted_data = predicted_data, 
                                                  observed_var = observed_var, 
                                                  predicted_var = predicted_var)
    
    output[sim] <- rmse_unit_record
    
  }
  
  return(output)
  
}


test <- mean(evaluate_unit_record_rmse_bulk(observed_data = synthetic_data_subset, 
                                       input = sc_missing_mcar_20, 
                                       observed_var = "selfcare_t1", 
                                       predicted_var = "selfcare_t1_imp", 
                                       method = "MICE"))

