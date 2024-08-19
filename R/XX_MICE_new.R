## ---- MICE

create_mice_input <- function(data, var){
  
  input_variables <- 
    colnames(data)[grepl(var, names(data))]
  
  
  data_to_impute <-
    data[, names(data) %in% c("unique_id", 
                              "randomisation", 
                              "sex", 
                              "age_cat", 
                              "education_cat", 
                              "hypertension", 
                              "heart_disease", 
                              "heart_failure",
                              input_variables)]
 
  
  predictor_matrix <- mice::make.predictorMatrix(data_to_impute)
  
  predictor_matrix[, c("unique_id")] <- 0
  
  return(list(data_to_impute, predictor_matrix))
   
}

apply_mice <- function(data_to_impute, predictor_matrix, iterations){
  
  mi_object <- mice(
    data_to_impute,
    m = iterations,
    maxit = 50,
    predictorMatrix = predictor_matrix,
    seed = 500
  )
  
  return(mi_object)
  
}

simulate_mice <- function(data, var, iterations){
  
  mice_input <- create_mice_input(data = data, 
                                  var = var)
  
  
  mice_output <- apply_mice(data_to_impute = mice_input[[1]], 
                            predictor_matrix = mice_input[[2]], 
                            iterations = iterations)
  
  return(mice_output)
  
}

simulate_mice_bulk <- function(input, var, imp_iterations){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    mice_simulation <- simulate_mice(data = input[[sim]], 
                                var = var, 
                                iterations = imp_iterations)
    
    output[[paste(sim)]] <- mice_simulation
    
  }
  
  return(output)
  
}

## ---- example-execution

mice_results_mcar_20 <- simulate_mice_bulk(input = results_mcar_20, 
                                           var = "selfcare", 
                                           imp_iterations = 20)

