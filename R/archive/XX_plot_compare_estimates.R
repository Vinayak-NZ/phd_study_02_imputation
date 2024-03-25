
## ---- self-care

data <- data.frame(x = c("MICE", "J2R", "LOCF", "LWD"),
                   y = c(40.80, 38.57, 37.23, 30.72),
                   lower = c(30.75, 30.42, 30.62, 20.76),
                   upper = c(50.36, 48.41, 48.07, 45.21))

data$x <- factor(data$x, levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

ggplot(data, aes(x, y)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = 30, linetype = "dashed", size = 1, color = "#46e7fd") + 
  geom_hline(yintercept = 40.75, size = 2, color = "#e18b22") + 
  geom_hline(yintercept = 51, linetype = "dashed", size = 1, color = "#4739a2") + 
  labs(title = "Estimating treatment effect on self-care", 
       subtitle = "Estimates and Confidence Intervals",
       caption = "Data source: Simulation study") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

## ---- physical-activity

data <- data.frame(x = c("MICE", "J2R", "LOCF", "LWD"),
                   y = c(21.80, 19.57, 19.23, 15.72),
                   lower = c(10.75, 10.42, 10.62, 5.76),
                   upper = c(30.36, 27.41, 27.07, 26.21))

data$x <- factor(data$x, levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

ggplot(data, aes(x, y)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = 10, linetype = "dashed", size = 1, color = "#46e7fd") + 
  geom_hline(yintercept = 21.75, size = 2, color = "#e18b22") + 
  geom_hline(yintercept = 32, linetype = "dashed", size = 1, color = "#4739a2") + 
  labs(title = "Estimating treatment effect on physical activity", 
       subtitle = "Estimates and Confidence Intervals",
       caption = "Data source: Simulation study") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))
