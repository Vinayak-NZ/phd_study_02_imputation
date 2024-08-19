## ---- J2R-preparation

create_j2r_input <- function(data, var){
  
  input_variables <- 
    colnames(data)[grepl(var, names(data))]
  
  data <- 
    data[, names(data) %in% c("unique_id", 
                              "randomisation",
                              "sex", 
                              "age_cat", 
                              "education_cat", 
                              input_variables)]
  
  return(data)
  
}

apply_j2r <- function(data_to_impute, var, iterations){
  
  set.seed(500)
  j2r_bootImps <- refBasedCts(data_to_impute, 
                                 outcomeVarStem = paste0(var, "_t"), 
                                 nVisits = 2, 
                                 trtVar = "randomisation", 
                                 baselineVars = paste0(var, "_t0"), 
                                 type = "J2R", 
                                 M = iterations)
  

  return(j2r_bootImps)
  
}

create_single_j2r <- function(j2rImps){
  
  j2r_bootImps_mids <- 
    datlist2mids(j2rImps, progress=FALSE)
  
  j2r_imputed_single <- 
    merge_imputations(data, 
                      j2r_bootImps_mids, 
                      ori = data)
  
  return(j2r_imputed_single)
  
}

simulate_j2r <- function(data, var, iterations){
  
 j2r_input <- create_j2r_input(data = data, 
                               var = var)
 
 j2r_output <- apply_j2r(data_to_impute = j2r_input, 
                         var = var, 
                         iterations = iterations)
 
 return(j2r_output)
   
}

simulate_j2r_bulk <- function(input, var, imp_iterations){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    j2r_simulation <- simulate_j2r(data = input[[sim]], 
                                     var = var, 
                                     iterations = imp_iterations)
    
    output[[paste(sim)]] <- j2r_simulation
    
  }
  
  return(output)
}

## ---- example-execution

j2r_results_mcar_20 <- simulate_j2r_bulk(input = results_mcar_20, 
                                           var = "selfcare", 
                                           imp_iterations = 20)
