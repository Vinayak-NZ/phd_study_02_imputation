

#generate a normal distribution plot
ggplot(data.frame(x = c(-4, 4)), aes(x = x)) +
  stat_function(fun = dnorm)


values <- seq(2, 6, by = .2)

true <- dnorm(values, mean = 3, sd = 0.5)

mice <- dnorm(values, mean = 3.5, sd = 1)

j2r <- dnorm(values, mean = 2, sd = 1)

listwise_deletion <- dnorm(values, mean = 5, sd = 4)

locf <- dnorm(values, mean = 6, sd = 1)

plot(values, true)

estimates <- data.frame(
  observed = true, 
  mice_imputation = mice, 
  reference_based_imputation = j2r, 
  locf_imputation = locf,
  listwise_deletion = listwise_deletion
)

ggplot() + 
  xlim(-100, 100) +
  geom_function(aes(colour = "Observed"), fun = dnorm, args = list(mean = -30, sd = 5)) +
  geom_function(aes(colour = "imputation = MICE"), fun = dnorm, args = list(mean = -35, sd = 5)) +
  geom_function(aes(colour = "imputation = J2R"), fun = dnorm, args = list(mean = -20, sd = 10)) +
  geom_function(aes(colour = "imputation = LOCF"), fun = dnorm, args = list(mean = -60, sd = 10)) +
  geom_function(aes(colour = "Listwise deletion"), fun = dnorm, args = list(mean = -50, sd = 40)) + 
  labs(title = "Estimating treatment effect on sedentary behaviour", 
       subtitle = "Bias and variance of missing data treatment",
       caption = "Data source: Simulation study") +
  xlab("Parameter estimate") + 
  ylab("Density") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic")
  ) + 
  guides(colour = guide_legend(title = "Data management"))

ggplot() + 
  xlim(-100, 100) +
  geom_function(aes(colour = "Observed"), fun = dnorm, args = list(mean = 30, sd = 5)) +
  geom_function(aes(colour = "imputation = MICE"), fun = dnorm, args = list(mean = 35, sd = 5)) +
  geom_function(aes(colour = "imputation = J2R"), fun = dnorm, args = list(mean = 20, sd = 10)) +
  geom_function(aes(colour = "imputation = LOCF"), fun = dnorm, args = list(mean = 60, sd = 10)) +
  geom_function(aes(colour = "Listwise deletion"), fun = dnorm, args = list(mean = 50, sd = 40)) + 
  labs(title = "Estimating treatment effect on moderate physical activity", 
       subtitle = "Bias and variance of missing data treatment",
       caption = "Data source: Simulation study") +
  xlab("Parameter estimate") + 
  ylab("Density") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic")
  ) + 
  guides(colour = guide_legend(title = "Data management"))

ggplot() + 
  xlim(-100, 100) +
  geom_function(aes(colour = "Observed"), fun = dnorm, args = list(mean = 20, sd = 2)) +
  geom_function(aes(colour = "imputation = MICE"), fun = dnorm, args = list(mean = 30, sd = 5)) +
  geom_function(aes(colour = "imputation = J2R"), fun = dnorm, args = list(mean = 10, sd = 10)) +
  geom_function(aes(colour = "imputation = LOCF"), fun = dnorm, args = list(mean = 60, sd = 10)) +
  geom_function(aes(colour = "Listwise deletion"), fun = dnorm, args = list(mean = 50, sd = 40)) + 
  labs(title = "Estimating treatment effect on vigorous physical activity", 
       subtitle = "Bias and variance of missing data treatment",
       caption = "Data source: Simulation study") +
  xlab("Parameter estimate") + 
  ylab("Density") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic")
  ) + 
  guides(colour = guide_legend(title = "Data management"))

ggplot() + 
  xlim(-5, 15) +
  geom_function(aes(colour = "Observed"), fun = dnorm, args = list(mean = 3.5, sd = 0.5)) +
  geom_function(aes(colour = "imputation = MICE"), fun = dnorm, args = list(mean = 3, sd = 0.5)) +
  geom_function(aes(colour = "imputation = J2R"), fun = dnorm, args = list(mean = 2, sd = 1)) +
  geom_function(aes(colour = "imputation = LOCF"), fun = dnorm, args = list(mean = 6, sd = 3)) +
  geom_function(aes(colour = "Listwise deletion"), fun = dnorm, args = list(mean = 5, sd = 4)) + 
  labs(title = "Estimating treatment effect on cardiovascular selfcare", 
       subtitle = "Bias and variance of missing data treatment",
       caption = "Data source: Simulation study") +
  xlab("Parameter estimate") + 
  ylab("Density") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic")
  ) + 
  guides(colour = guide_legend(title = "Data management"))








