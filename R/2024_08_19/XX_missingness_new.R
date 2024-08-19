## ---- function-simulate-missingness

simulate_missing_t1 <- function(data, var, proportion, miss_mech){
  
  data$unique_id <- 1:nrow(data)
  
  data_subset_t1 <- data[, c("unique_id", 
                             "randomisation", 
                             "sex", 
                             "age_cat", 
                             "education_cat", 
                             "hypertension", 
                             "heart_disease", 
                             "heart_failure", 
                             paste0(var, "_t0"), 
                             paste0(var, "_t1"))]
  
  patterns <- matrix(c(rep(1, 9), 0), 
                     nrow = 1, 
                     byrow = TRUE)
  
  data_subset_t1_missing <- mice::ampute(data_subset_t1, 
                            prop = proportion, 
                            patterns = patterns, 
                            mech = miss_mech)
  
  data_subset_t1_missing_output <- 
    data_subset_t1_missing$amp
  
  data_t1_missing_only <- 
    data_subset_t1_missing_output[is.na(data_subset_t1_missing_output[[paste0(var, "_t1")]]), ]
  
  data_t1_missing_only[[paste0(var, "_t2")]] <- NA
  
  return(list(data_subset_t1_missing_output, data_t1_missing_only, data))
  
}

create_t2_input <- function(data, var, data_subset_t1_missing_output){

  data_t1_complete <- 
    data_subset_t1_missing_output[complete.cases(data_subset_t1_missing_output), ]
  
  data_t1_complete_id <- data_t1_complete[, "unique_id"]
  
  data_t2 <- data[data$unique_id %in% data_t1_complete_id, 
                                        c("unique_id", 
                                          "randomisation", 
                                          "sex", 
                                          "age_cat", 
                                          "education_cat", 
                                          "hypertension", 
                                          "heart_disease", 
                                          "heart_failure", 
                                          "selfcare_t0", 
                                          paste0(var, "_t2"))]
  
  return(list(data_t1_complete, data_t2))
  
}

simulate_missing_t2 <- function(data_t2_subset, var, proportion, miss_mech){
 
  patterns <- matrix(c(rep(1, 9), 0), 
                     nrow = 1, 
                     byrow = TRUE)
  
  data_subset_t2_missing <- mice::ampute(data_t2_subset, 
                            prop = proportion, 
                            patterns = patterns, 
                            mech = miss_mech)
  
  data_subset_t2_missing_output <- 
    data_subset_t2_missing$amp[, c("unique_id", paste0(var, "_t2"))]
  
  return(data_subset_t2_missing_output)
  
}

combine_simulations <- function(data_t1_missing, data_t1_complete, data_t2){
  
  data_t2_t1_merge <- merge(data_t1_complete, data_t2, by = "unique_id")

  simulation_output <- rbind(data_t1_missing, data_t2_t1_merge)
  
  simulation_output <- simulation_output[order(simulation_output$unique_id), ]
  
  return(simulation_output)
  
}

simulate_missingness <- function(data, var, proportion, miss_mech){

  t1_output <- simulate_missing_t1(data = data, 
                                   var = var, 
                                   proportion = proportion, 
                                   miss_mech = miss_mech)
  
  t2_input <- create_t2_input(data = t1_output[[3]], 
                              var = var, 
                              data_subset_t1_missing_output = t1_output[[1]])
  
  t2_output <- simulate_missing_t2(data_t2_subset = t2_input[[2]], 
                                   var = var, 
                                   proportion = proportion, 
                                   miss_mech = miss_mech)
  
  simulation_output <- combine_simulations(data_t1_missing = t1_output[[2]], 
                                           data_t1_complete = t2_input[[1]], 
                                           data_t2 = t2_output)
  
  return(simulation_output)
    
}

simulate_missingness_bulk <-function(data, var, proportion, miss_mech, iterations){
  
  output <- list()
  
  for (sim in 1:iterations) {
    
    simulation <- simulate_missingness(data = data, 
                                 var = var, 
                                 proportion = proportion, 
                                 miss_mech = miss_mech)
    
    output[[paste(sim)]] <- simulation
  }
  
  return(output)
  
}


## ---- example-execution

results_mcar_20 <- simulate_missingness_bulk(data = synthetic_data_subset, 
                                             var = "selfcare", 
                                             proportion = 0.2,
                                             miss_mech = "MCAR",
                                             iterations = 5)
