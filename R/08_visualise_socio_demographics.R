## ---- demographics

# sex
subset_data_sex <- subset_data

subset_data_sex$sex <- ifelse(subset_data_sex$sex == 1, 
                              "Female", 
                              "Male")

subset_data_sex$randomisation <- ifelse(subset_data_sex$randomisation == 1, 
                              "Intervention", 
                              "Control")

subset_data_sex_con <- 
  subset_data_sex[subset_data_sex$randomisation == "Control", ]

subset_data_sex_int <- 
  subset_data_sex[subset_data_sex$randomisation == "Intervention", ]

table_sex_rand <- as.data.frame(
  table(subset_data_sex$randomisation, 
        subset_data_sex$sex))

colnames(table_sex_rand)[
  names(table_sex_rand) == "Var1"] <- 
  "randomisation"

colnames(table_sex_rand)[
  names(table_sex_rand) == "Var2"] <- 
  "sex"

table_sex_rand$percentage <- 
  ifelse(table_sex_rand$randomisation == "Control",
         (table_sex_rand$Freq/nrow(subset_data_sex_con))*100, 
         (table_sex_rand$Freq/nrow(subset_data_sex_int))*100)
  
sex_order <- c('Female', 'Male')

socio_demo_sex <- 
  ggplot(data = table_sex_rand, 
         aes(x = factor(sex, level = sex_order), 
             y = percentage)) + 
  geom_bar(stat = "identity", fill = "#4739a2") +
  facet_wrap(~randomisation) +
  labs(title = paste0("Characteristics of sample"), 
       subtitle = "Bar chart of sex distribution in sample",
       caption = "Data source: Cardiovascular Rehabilitation Tool") +
  xlab("Sex") + 
  ylab("Percentage \n (% of treatment group)") +
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

subset_data_age$randomisation <- 
  ifelse(subset_data_age$randomisation == 1, 
         "Intervention", 
         "Control")

socio_demo_age <- 
  ggplot(subset_data_age, aes(x = age)) +
  geom_histogram(bins = 25, fill = "#4739a2") +
  facet_wrap(~randomisation) +
  labs(title = paste0("Characteristics of sample"), 
       subtitle = "Histogram of age distribution in sample",
       caption = "Data source: Cardiovascular Rehabilitation Tool") +
  xlab("Age") + 
  ylab("Frequency") + 
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

subset_data_education$randomisation <- 
  ifelse(subset_data_education$randomisation == 1, 
         "Intervention", 
         "Control")

table_education <- as.data.frame(
  table(subset_data_education$randomisation, 
        subset_data_education$education_cat))

names(table_education)[names(table_education) == "Var1"] <- 
  "randomisation"

names(table_education)[names(table_education) == "Var2"] <- 
  "education"

names(table_education)[names(table_education) == "Freq"] <- 
  "frequency"

socio_demo_education <- 
  ggplot(data = table_education, 
         aes(fill = education, 
             y = frequency, 
             x = randomisation)) + 
  geom_bar(position="fill", stat="identity") + 
  scale_fill_manual(values = c("#46e7fd", 
                               "#4739a2", 
                               "#e18b22"), 
                    labels = labels) +
  labs(title = paste0("Characteristics of sample"), 
       subtitle = "Bar chart of highest qualification obtained",
       caption = "Data source: Cardiovascular Rehabilitation Tool", 
       fill = "Education") +
  xlab("Education") + 
  ylab("Proportion") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")) 

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

subset_data_health$randomisation <- 
  ifelse(subset_data_health$randomisation == 1, 
         "Intervention", 
         "Control")

subset_data_health_con <- 
  subset_data_health[subset_data_health$randomisation == "Control", ]

subset_data_health_int <- 
  subset_data_health[subset_data_health$randomisation == "Intervention", ]

health_control_agg <- 
  as.data.frame(table(subset_data_health_con$heart_disease, 
                      subset_data_health_con$heart_failure, 
                      subset_data_health_con$hypertension))

health_control_agg$percentage <- 
  (health_control_agg$Freq/nrow(subset_data_health_con))*100

colnames(health_control_agg)[
  names(health_control_agg) == "Var1"] <- 
  "heart_disease"

colnames(health_control_agg)[names(health_control_agg) == "Var2"] <- 
  "heart_failure"

colnames(health_control_agg)[names(health_control_agg) == "Var3"] <- 
  "hypertension"

health_control_agg <- health_control_agg[, 
                     c("heart_disease", 
                       "heart_failure", 
                       "hypertension",
                       "percentage")]

health_control_agg$randomisation <- "Control"

health_int_agg <- 
  as.data.frame(table(subset_data_health_int$heart_disease, 
                      subset_data_health_int$heart_failure, 
                      subset_data_health_int$hypertension))

health_int_agg$percentage <- 
  (health_int_agg$Freq/nrow(subset_data_health_int))*100

colnames(health_int_agg)[
  names(health_int_agg) == "Var1"] <- 
  "heart_disease"

colnames(health_int_agg)[names(health_int_agg) == "Var2"] <- 
  "heart_failure"

colnames(health_int_agg)[names(health_int_agg) == "Var3"] <- 
  "hypertension"

health_int_agg <- health_int_agg[, 
                                         c("heart_disease", 
                                           "heart_failure", 
                                           "hypertension",
                                           "percentage")]

health_int_agg$randomisation <- "Intervention"

data_health_agg <- rbind(health_control_agg, health_int_agg)

health_level = c("Yes", "No")

health_plot <- 
  ggplot(data_health_agg, 
       aes(x = factor(heart_disease, level = health_level), 
           fill = factor(heart_failure, level = health_level),  
           y = percentage)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = c("#46e7fd", "#e18b22")) + 
  labs(title = paste0("Characteristics of sample"), 
       subtitle = "Bar chart of cardiovascular diagnoses",
       caption = "Data source: Cardiovascular Rehabilitation Tool", 
       fill = "Heart failure") +
  xlab("Heart disease") + 
  ylab("Percentage \n (% of treatment group)") + 
  facet_wrap(hypertension~randomisation, 
             labeller = labeller(hypertension = hypertension.labs)) + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic"))

ggsave("output/health_plot.png", 
       plot = health_plot)