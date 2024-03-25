## ---- synthetic-data-comparisons

# randomisation
subset_data_randomisation <- subset_data

subset_data_randomisation$randomisation <- ifelse(subset_data_randomisation$randomisation == 0, "Control", "Intervention")

synthetic_data_randomisation <- synthetic_data

synthetic_data_randomisation$randomisation <- ifelse(synthetic_data_randomisation$randomisation == 0, "Control", "Intervention")

raw_table_randomisation <- as.data.frame(prop.table(table(subset_data_randomisation$randomisation)))

synthetic_table_randomisation <- as.data.frame(prop.table(table(synthetic_data_randomisation$randomisation)))

table_randomisation <- rbind(raw_table_randomisation, synthetic_table_randomisation)

names(table_randomisation)[names(table_randomisation) == "Var1"] <- "Randomisation"

names(table_randomisation)[names(table_randomisation) == "Freq"] <- "Proportion"

table_randomisation$Proportion <- table_randomisation$Proportion*100

table_randomisation$data_source <- c("Raw data", "Raw data", "Synthetic data", "Synthetic data")

data_compare_randomisation <- 
  ggplot(table_randomisation, aes(fill=Randomisation, y=Proportion, x=data_source)) + 
  geom_bar(position="stack", stat="identity") + 
  scale_fill_manual(values = c("#e18b22", "#46e7fd")) +
  labs(title = paste0("Comparing Synthetic and Raw data"), 
       subtitle = "Bar chart of randomisation distribution in datasets",
       caption = "Data source: Cardiovascular Rehabilitation Tool") +
  xlab("Randomisation") + 
  ylab("Percentage composition") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")) 

ggsave("output/data_compare_randomisation.png", 
       plot = data_compare_randomisation)

# sex
subset_data_sex <- subset_data

subset_data_sex$sex <- ifelse(subset_data_sex$sex == 1, "Female", "Male")

synthetic_data_sex <- synthetic_data

synthetic_data_sex$sex <- ifelse(synthetic_data_sex$sex == 1, "Female", "Male")

raw_table_sex <- as.data.frame(prop.table(table(subset_data_sex$sex)))

synthetic_table_sex <- as.data.frame(prop.table(table(synthetic_data_sex$sex)))

table_sex <- rbind(raw_table_sex, synthetic_table_sex)

names(table_sex)[names(table_sex) == "Var1"] <- "Sex"

names(table_sex)[names(table_sex) == "Freq"] <- "Proportion"

table_sex$Proportion <- table_sex$Proportion*100

table_sex$data_source <- c("Raw data", "Raw data", "Synthetic data", "Synthetic data")

data_compare_sex <- 
  ggplot(table_sex, aes(fill=Sex, y=Proportion, x=data_source)) + 
  geom_bar(position="stack", stat="identity") + 
  scale_fill_manual(values = c("#e18b22", "#46e7fd")) +
  labs(title = paste0("Comparing Synthetic and Raw data"), 
       subtitle = "Bar chart of sex distribution in datasets",
       caption = "Data source: Cardiovascular Rehabilitation Tool") +
  xlab("Sex") + 
  ylab("Percentage composition") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")) 

ggsave("output/data_compare_sex.png", 
       plot = data_compare_sex)

# education
subset_data_education <- subset_data

subset_data_education$education_cat <- 
  ifelse(subset_data_education$education_cat == 1, 
         "L1", 
         ifelse(subset_data_education$education_cat == 2, 
                "L2", "L3"))

synthetic_data_education <- synthetic_data_subset

synthetic_data_education$education_cat <- 
  ifelse(synthetic_data_education$education_cat == 1, 
         "L1", 
         ifelse(synthetic_data_education$education_cat == 2, 
                "L2", "L3"))

raw_table_education <- as.data.frame(prop.table(table(subset_data_education$education_cat)))

synthetic_table_education <- as.data.frame(prop.table(table(synthetic_data_education$education_cat)))

table_education <- rbind(raw_table_education, synthetic_table_education)

names(table_education)[names(table_education) == "Var1"] <- "Education"

names(table_education)[names(table_education) == "Freq"] <- "Proportion"

table_education$Proportion <- table_education$Proportion*100

table_education$data_source <- c("Raw data", "Raw data", "Raw data", "Synthetic data", "Synthetic data", "Synthetic data")

labels <- c(L1 = 'L1 = Secondary/ elementary school', 
            L2 = 'L2 = University degree - Polytechnic', 
            L3 = 'L3 = University degree')

data_compare_education <- 
  ggplot(table_education, aes(fill=Education, y=Proportion, x=data_source)) + 
  geom_bar(position="stack", stat="identity") + 
  scale_fill_manual(values = c("#e18b22", "#46e7fd", "#4739a2"), labels = labels) +
  labs(title = paste0("Comparing Synthetic and Raw data"), 
       subtitle = "Bar chart of education attainment in datasets",
       caption = "Data source: Cardiovascular Rehabilitation Tool") +
  xlab("Education") + 
  ylab("Percentage composition") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic"))

ggsave("output/data_compare_education.png", 
       plot = data_compare_education)

# age

subset_data_age <- subset_data

subset_data_age$age_cat <- 
  ifelse(subset_data_age$age_cat == 1, 
         "<= 50", 
         ifelse(subset_data_age$age_cat == 2, 
                "51 - 60", ifelse(subset_data_age$age_cat == 3, "61 - 70", "70+")))

synthetic_data_age <- synthetic_data_subset

synthetic_data_age$age_cat <- 
  ifelse(synthetic_data_age$age_cat == 1, 
         "<= 50", 
         ifelse(synthetic_data_age$age_cat == 2, 
                "51 - 60", ifelse(synthetic_data_age$age_cat == 3, "61 - 70", "70+")))

raw_table_age <- as.data.frame(prop.table(table(subset_data_age$age_cat)))

synthetic_table_age <- as.data.frame(prop.table(table(synthetic_data_age$age_cat)))

table_age <- rbind(raw_table_age, synthetic_table_age)

names(table_age)[names(table_age) == "Var1"] <- "Age"

names(table_age)[names(table_age) == "Freq"] <- "Proportion"

table_age$Proportion <- table_age$Proportion*100

table_age$data_source <- c("Raw data", 
                                 "Raw data", 
                                 "Raw data", 
                                 "Raw data", 
                                 "Synthetic data", 
                                 "Synthetic data", 
                                 "Synthetic data", 
                                 "Synthetic data")

data_compare_age <- 
  ggplot(table_age, aes(fill=Age, y=Proportion, x=data_source)) + 
  geom_bar(position="stack", stat="identity") + 
  scale_fill_manual(values = c("#e18b22", "#46e7fd", "#4739a2", "#f2e4d3")) +
  labs(title = paste0("Comparing Synthetic and Raw data"), 
       subtitle = "Bar chart of age distribution in datasets",
       caption = "Data source: Cardiovascular Rehabilitation Tool") +
  xlab("Age") + 
  ylab("Percentage composition") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")) 

ggsave("output/data_compare_age.png", 
       plot = data_compare_age)

# self-care

subset_data_selfcare <- subset_data[, c("randomisation", "sex", "age_cat","education_cat", 
                                        "hypertension", "heart_disease", "heart_failure", 
                                        "selfcare_t0", "physical_activity_t0")]

subset_data_selfcare$data_source <- "Raw data"

synthetic_data_selfcare <- subset_data[, c("randomisation", "sex", "age_cat","education_cat", 
                                        "hypertension", "heart_disease", "heart_failure", 
                                        "selfcare_t0", "physical_activity_t0")]

synthetic_data_selfcare$data_source <- "Synthetic data"

data_binded_selfcare <- rbind(subset_data_selfcare, synthetic_data_selfcare)

data_compare_selfcare <- 
  ggplot(data_binded_selfcare, aes(x=data_source, y = selfcare_t0, fill = data_source)) + 
  geom_boxplot() + 
  scale_fill_manual(values = c("#e18b22", "#46e7fd")) +
  labs(title = paste0("Disease self-management"), 
       subtitle = "Boxplot of distribution for selfcare scores",
       caption = "Data source: Cardiovascular Rehabilitation Tool", 
       fill = "Data Source") +
  xlab("Data Source") + 
  ylab("Selfcare scores") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic"), 
        legend.position = "none") 

ggsave("output/data_compare_selfcare.png", 
       plot = data_compare_selfcare)

# physical activity

subset_data_physical_activity <- subset_data[, c("randomisation", "sex", "age_cat","education_cat", 
                                        "hypertension", "heart_disease", "heart_failure", 
                                        "selfcare_t0", "physical_activity_t0")]

subset_data_physical_activity$data_source <- "Raw data"

synthetic_data_physical_activity <- subset_data[, c("randomisation", "sex", "age_cat","education_cat", 
                                           "hypertension", "heart_disease", "heart_failure", 
                                           "selfcare_t0", "physical_activity_t0")]

synthetic_data_physical_activity$data_source <- "Synthetic data"

data_binded_physical_activity <- rbind(subset_data_physical_activity, synthetic_data_physical_activity)

data_compare_physical_activity <- 
  ggplot(data_binded_physical_activity, aes(x=data_source, y = physical_activity_t0, fill = data_source)) + 
  geom_boxplot() + 
  scale_fill_manual(values = c("#e18b22", "#46e7fd")) +
  labs(title = paste0("Physical activity"), 
       subtitle = "Boxplot of distribution for physical activity",
       caption = "Data source: Cardiovascular Rehabilitation Tool", 
       fill = "Data Source") +
  xlab("Data Source") + 
  ylab("IPAQ scores") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic"), 
        legend.position = "none")

ggsave("output/data_compare_physical_activity.png", 
       plot = data_compare_physical_activity)

