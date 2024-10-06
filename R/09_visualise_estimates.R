## ---- visualise-treatment-effects

observed_sc_low <- 
  observed_model_summary_sc$coefficients[2] -  
  1.96*(observed_model_summary_sc$coefficients[2, 2])
  
observed_sc_est <- 
  observed_model_summary_sc$coefficients[2]
  
observed_sc_high <- 
  observed_model_summary_sc$coefficients[2] +  
  1.96*(observed_model_summary_sc$coefficients[2, 2])

observed_pa_low <- 
  observed_model_summary_pa$coefficients[2] -  
  1.96*(observed_model_summary_pa$coefficients[2, 2])

observed_pa_est <- 
  observed_model_summary_pa$coefficients[2]

observed_pa_high <- 
  observed_model_summary_pa$coefficients[2] +  
  1.96*(observed_model_summary_pa$coefficients[2, 2])

# self-care-mcar-20

data_estimates_sc_mcar_20$source <- 
  factor(data_estimates_sc_mcar_20$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc_mcar_20 <- 
  ggplot(data_estimates_sc_mcar_20, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_sc_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_sc_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_sc_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on self-care", 
       subtitle = "MCAR 20%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# self-care-mcar-30

data_estimates_sc_mcar_30$source <- 
  factor(data_estimates_sc_mcar_30$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc_mcar_30 <- 
  ggplot(data_estimates_sc_mcar_30, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_sc_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_sc_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_sc_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on self-care", 
       subtitle = "MCAR 30%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# self-care-mcar-40

data_estimates_sc_mcar_40$source <- 
  factor(data_estimates_sc_mcar_40$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc_mcar_40 <- 
  ggplot(data_estimates_sc_mcar_40, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_sc_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_sc_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_sc_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on self-care", 
       subtitle = "MCAR 40%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# self-care-mar-20

data_estimates_sc_mar_20$source <- 
  factor(data_estimates_sc_mar_20$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc_mar_20 <- 
  ggplot(data_estimates_sc_mar_20, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_sc_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_sc_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_sc_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on self-care", 
       subtitle = "MAR 20%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# self-care-mar-30

data_estimates_sc_mar_30$source <- 
  factor(data_estimates_sc_mar_30$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc_mar_30 <- 
  ggplot(data_estimates_sc_mar_30, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_sc_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_sc_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_sc_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on self-care", 
       subtitle = "MAR 30%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# self-care-mar-40

data_estimates_sc_mar_40$source <- 
  factor(data_estimates_sc_mar_40$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc_mar_40 <- 
  ggplot(data_estimates_sc_mar_40, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_sc_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_sc_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_sc_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on self-care", 
       subtitle = "MAR 40%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# self-care-mnar-20

data_estimates_sc_mnar_20$source <- 
  factor(data_estimates_sc_mnar_20$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc_mnar_20 <- 
  ggplot(data_estimates_sc_mnar_20, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_sc_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_sc_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_sc_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on self-care", 
       subtitle = "MNAR 20%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# self-care-mnar-30

data_estimates_sc_mnar_30$source <- 
  factor(data_estimates_sc_mnar_30$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc_mnar_30 <- 
  ggplot(data_estimates_sc_mnar_30, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_sc_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_sc_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_sc_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on self-care", 
       subtitle = "MNAR 30%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# self-care-mnar-40

data_estimates_sc_mnar_40$source <- 
  factor(data_estimates_sc_mnar_40$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc_mnar_40 <- 
  ggplot(data_estimates_sc_mnar_40, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_sc_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_sc_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_sc_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on self-care", 
       subtitle = "MNAR 40%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# physical-activity-mcar-20

data_estimates_pa_mcar_20$source <- 
  factor(data_estimates_pa_mcar_20$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa_mcar_20 <- 
  ggplot(data_estimates_pa_mcar_20, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_pa_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_pa_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_pa_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on physical-activityity", 
       subtitle = "MCAR 20%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# physical-activity-mcar-30

data_estimates_pa_mcar_30$source <- 
  factor(data_estimates_pa_mcar_30$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa_mcar_30 <- 
  ggplot(data_estimates_pa_mcar_30, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_pa_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_pa_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_pa_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on physical-activityity", 
       subtitle = "MCAR 30%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# physical-activity-mcar-40

data_estimates_pa_mcar_40$source <- 
  factor(data_estimates_pa_mcar_40$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa_mcar_40 <- 
  ggplot(data_estimates_pa_mcar_40, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_pa_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_pa_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_pa_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on physical-activityity", 
       subtitle = "MCAR 40%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# physical-activity-mar-20

data_estimates_pa_mar_20$source <- 
  factor(data_estimates_pa_mar_20$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa_mar_20 <- 
  ggplot(data_estimates_pa_mar_20, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_pa_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_pa_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_pa_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on physical-activityity", 
       subtitle = "MAR 20%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# physical-activity-mar-30

data_estimates_pa_mar_30$source <- 
  factor(data_estimates_pa_mar_30$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa_mar_30 <- 
  ggplot(data_estimates_pa_mar_30, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_pa_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_pa_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_pa_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on physical-activityity", 
       subtitle = "MAR 30%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# physical-activity-mar-40

data_estimates_pa_mar_40$source <- 
  factor(data_estimates_pa_mar_40$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa_mar_40 <- 
  ggplot(data_estimates_pa_mar_40, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_pa_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_pa_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_pa_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on physical-activityity", 
       subtitle = "MAR 40%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# physical-activity-mnar-20

data_estimates_pa_mnar_20$source <- 
  factor(data_estimates_pa_mnar_20$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa_mnar_20 <- 
  ggplot(data_estimates_pa_mnar_20, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_pa_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_pa_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_pa_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on physical-activityity", 
       subtitle = "MNAR 20%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# physical-activity-mnar-30

data_estimates_pa_mnar_30$source <- 
  factor(data_estimates_pa_mnar_30$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa_mnar_30 <- 
  ggplot(data_estimates_pa_mnar_30, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_pa_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_pa_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_pa_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on physical-activityity", 
       subtitle = "MNAR 30%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

# physical-activity-mnar-40

data_estimates_pa_mnar_40$source <- 
  factor(data_estimates_pa_mnar_40$source, 
         levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa_mnar_40 <- 
  ggplot(data_estimates_pa_mnar_40, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_pa_low, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_pa_est, 
             linewidth = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_pa_high, 
             linetype = "dashed", 
             linewidth = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating intervention effects on physical-activityity", 
       subtitle = "MNAR 40%",
       caption = "Data source: DHI C") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))