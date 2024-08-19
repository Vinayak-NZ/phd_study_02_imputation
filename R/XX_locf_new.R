## ---- impute-locf-single-var
simulate_locf <- function(data, var){
  
  data[[paste0(var, "_t1")]] <- ifelse(is.na(data[[paste0(var, "_t1")]]), 
                                       data[[paste0(var, "_t0")]], data[[paste0(var, "_t1")]])
  
  data[[paste0(var, "_t2")]] <- ifelse(is.na(data[[paste0(var, "_t2")]]), 
                                       data[[paste0(var, "_t1")]], data[[paste0(var, "_t2")]])
  
  return(data)
  
}

simulate_locf_bulk <- function(input, var){
  
  output <- list()
  
  sim_iterations <- length(input)
  
  for (sim in 1:sim_iterations) {
    
    locf_simulation <- simulate_locf(data = input[[sim]], 
                                   var = var)
    
    output[[paste(sim)]] <- locf_simulation
    
  }
  
  return(output)
}

## ---- example-execution

locf_results_mcar_20 <- simulate_locf_bulk(input = results_mcar_20, 
                                         var = "selfcare")
