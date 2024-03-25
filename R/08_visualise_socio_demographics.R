## ---- demographics


# sex
subset_data_sex <- subset_data

subset_data_sex$sex <- ifelse(subset_data_sex$sex == 1, "Female", "Male")

socio_demo_sex <- 
  ggplot(data = subset_data_sex, aes(x = sex, fill = sex)) + 
  geom_bar(key_glyph = draw_key_blank) + 
  labs(title = paste0("Characteristics of sample"), 
       subtitle = "Bar chart of sex distribution in sample",
       caption = "Data source: Cardiovascular Rehabilitation Tool") +
  xlab("Sex") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic"), 
        legend.position = "none") 

ggsave("output/socio_demo_sex.png", 
       plot = socio_demo_sex)

# age

subset_data_age <- subset_data[subset_data$age > 18, ] 

subset_data_age <- subset_data_age[!is.na(subset_data_age$age), ]

socio_demo_age <- 
  ggplot(subset_data_age, aes(x = age)) +
  geom_histogram(bins = 25, fill = "#4739a2") +
  labs(title = paste0("Characteristics of sample"), 
       subtitle = "Histogram of age distribution in sample",
       caption = "Data source: Cardiovascular Rehabilitation Tool") +
  xlab("Age") + 
  ylab("Count") + 
  xlim(0, 90) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")
  )

ggsave("output/socio_demo_age.png", 
       plot = socio_demo_age)

# education

subset_data_education <- 
  subset_data[subset_data$education_cat %in% 
                    c(1, 2, 3), ]

subset_data_education$education_cat <- 
  ifelse(subset_data_education$education_cat == 1, 
         "L1", 
         ifelse(subset_data_education$education_cat == 2, 
                "L2", "L3"))

labels <- c(L1 = 'L1 = Secondary/ elementary school', 
            L2 = 'L2 = University degree - Polytechnic', 
            L3 = 'L3 = University degree')

socio_demo_education <- 
  ggplot(data = subset_data_education, aes(x = education_cat, fill = education_cat)) + 
  geom_bar(key_glyph = draw_key_blank) + 
  scale_fill_manual(values = rep("#4739a2", length(labels)), labels = labels) +
  labs(title = paste0("Characteristics of sample"), 
       subtitle = "Bar chart of highest qualification obtained",
       caption = "Data source: Cardiovascular Rehabilitation Tool", 
       fill = "Education") +
  xlab("Education") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic"), 
        legend.key = element_rect(fill = NA),
        legend.key.width = unit(0, "pt"),
        legend.spacing.x = unit(0, "pt")) 

ggsave("output/socio_demo_education.png", 
       plot = socio_demo_education)

## ---- health

# heart-conditions

subset_data_health <- subset_data

subset_data_health$heart_disease <- ifelse(subset_data_health$heart_disease == 1, "No", "Yes")

subset_data_health$heart_failure <- ifelse(subset_data_health$heart_failure == 1, "No", "Yes")

subset_data_health$hypertension <- ifelse(subset_data_health$hypertension == 1, "No", "Yes")

subset_data_health$heart_disease <- factor(subset_data_health$heart_disease, levels=c('Yes', 'No'))

subset_data_health$heart_failure <- factor(subset_data_health$heart_failure, levels=c('Yes', 'No'))

subset_data_health$hypertension <- factor(subset_data_health$hypertension, levels=c('Yes', 'No'))

hypertension.labs <- c("Hypertension = Yes", "Hypertension = No")
names(hypertension.labs) <- c("Yes", "No")

health_plot <- 
  ggplot(subset_data_health) +
  geom_bar(aes(x=heart_disease, fill=heart_failure),
           position = "dodge") +
  scale_fill_manual(values = c("#46e7fd", "#e18b22")) +
  labs(title = paste0("Characteristics of sample"), 
       subtitle = "Bar chart of cardiovascular diagnoses in sample",
       caption = "Data source: Cardiovascular Rehabilitation Tool", 
       fill = "Heart Failure") +
  xlab("Heart Disease") + 
  ylab("Count") + 
  facet_wrap(~hypertension, 
             labeller = labeller(hypertension = hypertension.labs)) + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")) 

ggsave("output/health_plot.png", 
       plot = health_plot)