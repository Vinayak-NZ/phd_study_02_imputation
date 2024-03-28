## ---- visualise-treatment-effects

# self-care

data_estimates_sc <- data.frame(source = c("MICE", "J2R", "LOCF", "LWD"),
                   point_estimate = c(mice_pooled_output_sc$est[2], 
                         j2r_pooled_output_sc$est[2], 
                         locf_model_sc_summary$coefficients[2], 
                         lwd_model_sc_summary$coefficients[2]),
                   lower = c(mice_pooled_output_sc$est[2] - mice_pooled_output_sc$se[2], 
                             j2r_pooled_output_sc$est[2] - mice_pooled_output_sc$se[2], 
                             locf_model_sc_summary$coefficients[2] - locf_model_sc_summary$coefficients[2, 2], 
                             lwd_model_sc_summary$coefficients[2] - lwd_model_sc_summary$coefficients[2, 2]),
                   upper = c(mice_pooled_output_sc$est[2] + mice_pooled_output_sc$se[2], 
                             j2r_pooled_output_sc$est[2] + j2r_pooled_output_sc$se[2], 
                             locf_model_sc_summary$coefficients[2] + locf_model_sc_summary$coefficients[2, 2], 
                             lwd_model_sc_summary$coefficients[2] + lwd_model_sc_summary$coefficients[2, 2]))

data_estimates_sc$source <- factor(data_estimates_sc$source, 
                              levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_sc <- 
  ggplot(data_estimates_sc, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_model_summary_sc$coefficients[2] - observed_model_summary_sc$coefficients[2, 2], 
             linetype = "dashed", 
             size = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_model_summary_sc$coefficients[2], 
             size = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_model_summary_sc$coefficients[2] + observed_model_summary_sc$coefficients[2, 2], 
             linetype = "dashed", 
             size = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating treatment effect on self-care", 
       subtitle = "Estimates and Confidence Intervals",
       caption = "Data source: Cardiovascular Rehabilitation Tool") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

ggsave("output/plot_estimates_sc.png", 
       plot = plot_estimates_sc)

# physical-activity

data_estimates_pa <- data.frame(source = c("MICE", "J2R", "LOCF", "LWD"),
                   point_estimate = c(mice_pooled_output_pa$est[2], 
                         j2r_pooled_output_pa$est[2], 
                         locf_model_pa_summary$coefficients[2], 
                         lwd_model_pa_summary$coefficients[2]),
                   lower = c(mice_pooled_output_pa$est[2] - mice_pooled_output_pa$se[2], 
                             j2r_pooled_output_pa$est[2] - mice_pooled_output_pa$se[2], 
                             locf_model_pa_summary$coefficients[2] - locf_model_pa_summary$coefficients[2, 2], 
                             lwd_model_pa_summary$coefficients[2] - lwd_model_pa_summary$coefficients[2, 2]),
                   upper = c(mice_pooled_output_pa$est[2] + mice_pooled_output_pa$se[2], 
                             j2r_pooled_output_pa$est[2] + j2r_pooled_output_pa$se[2], 
                             locf_model_pa_summary$coefficients[2] + locf_model_pa_summary$coefficients[2, 2], 
                             lwd_model_pa_summary$coefficients[2] + lwd_model_pa_summary$coefficients[2, 2]))

data_estimates_pa$source <- factor(data_estimates_pa$source, 
                                   levels = c("Observed", "MICE", "J2R", "LOCF", "LWD"))

plot_estimates_pa <- 
ggplot(data_estimates_pa, aes(source, point_estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = lower, ymax = upper)) + 
  geom_hline(yintercept = observed_model_summary_pa$coefficients[2] - observed_model_summary_pa$coefficients[2, 2], 
             linetype = "dashed", 
             size = 1, 
             color = "#46e7fd") + 
  geom_hline(yintercept = observed_model_summary_pa$coefficients[2], 
             size = 2, 
             color = "#e18b22") + 
  geom_hline(yintercept = observed_model_summary_pa$coefficients[2] + observed_model_summary_pa$coefficients[2, 2], 
             linetype = "dashed", 
             size = 1, 
             color = "#4739a2") + 
  labs(title = "Estimating treatment effect on physical activity", 
       subtitle = "Estimates and Confidence Intervals",
       caption = "Data source: Cardiovascular Rehabilitation Tool") + 
  xlab("Method for managing dropout") + 
  ylab("Parameter estimate") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

ggsave("output/plot_estimates_pa.png", 
       plot = plot_estimates_pa)