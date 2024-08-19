## ---- MICE

subset_vars <- c("selfcare", "physical_activity")

input_variables <- 
  colnames(synthetic_data_missing)[grepl(paste(subset_vars, collapse = "|"), 
                                         names(synthetic_data_missing))]

data_to_impute <-
  synthetic_data_missing[, 
                         names(synthetic_data_missing) %in% c("unique_id", 
                                                              input_variables)]

missing_input_vars <-
  colnames(data_to_impute)[apply(data_to_impute,
                                 2,
                                 anyNA)]

data_to_impute <-
  synthetic_data_missing[, 
                         names(synthetic_data_missing) %in% 
                           c("unique_id", missing_input_vars)]

data_remainder <- synthetic_data_missing[, 
                                         !names(synthetic_data_missing) %in% 
                                           missing_input_vars]

predictor_matrix <- matrix(rep(1,
                               ncol(data_to_impute) * ncol(data_to_impute)),
                           nrow = ncol(data_to_impute),
                           byrow = TRUE)
diag(predictor_matrix) <- 0
predictor_matrix[, 1] <- 0

mi_object <- mice(
  data_to_impute,
  m = 10,
  maxit = 50,
  predictorMatrix = predictor_matrix,
  seed = 500
)

data_imputed <- merge_imputations(data_to_impute,
                                  mi_object,
                                  ori = data_to_impute)

data_mice <- merge(data_remainder, data_imputed, by = "unique_id")
