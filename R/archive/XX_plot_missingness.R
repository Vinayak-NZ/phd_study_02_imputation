miss_data <- read.csv("input/dummy_missingness_t0.csv")

gg_miss_fct(x = miss_data, fct = randomisation)

miss_data <- read.csv("input/dummy_missingness_t1.csv")

gg_miss_fct(x = miss_data, fct = randomisation)

miss_data <- read.csv("input/dummy_missingness_t2.csv")

gg_miss_fct(x = miss_data, fct = randomisation)

miss_data <- read.csv("input/dummy_missingness_all.csv")

gg_miss_fct(x = miss_data, fct = randomisation)
