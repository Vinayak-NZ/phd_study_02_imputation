## ---- missing-data-visualisation

# create data-frame

Randomisation <- c(rep("Control", 6), rep("Intervention", 6))

Variable <- c(rep("Selfcare", 3), 
              rep("Physical activity", 3), 
              rep("Selfcare", 3), 
              rep("Physical activity", 3))

Time <- c(rep(c("Baseline", "12-week", "24-week"), 4))

Missing <- c(0, 20, 40, 
             0, 20, 40, 
             0, 20, 40, 
             0, 20, 40)

missing_data_table <- as.data.frame(cbind(Randomisation, 
                                          Variable, 
                                          Time, 
                                          as.numeric(Missing)))

missing_data_table$Time <- factor(missing_data_table$Time, levels=c('Baseline', 
                                                                    '12-week', 
                                                                    '24-week'))

missingness_plot <- 
  ggplot(missing_data_table, aes(fill=Variable, y=Missing, x=Time)) + 
  geom_bar(position="dodge", stat="identity") +
  scale_fill_manual(values = c("#e18b22", "#46e7fd")) +
  facet_wrap(~Randomisation) +
  labs(title = paste0("Missing data simulation"), 
       subtitle = "Bar chart of missingness simulated in synthetic data",
       caption = "Data source: Cardiovascular Rehabilitation Tool") +
  xlab("Time") + 
  ylab("Percentage missing") + 
  ylim(0, 100) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")) 

ggsave("output/missingness_plot.png", 
       plot = missingness_plot)
