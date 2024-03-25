## ---- self-care

pilot_study <- data.frame(
  arm = factor(rep(c("control", "intervention"), each = 20)), 
  walking = round(c(rnorm(20, mean = 30, sd = 3), rnorm(20, mean = 70, sd = 5)))
)

clinical_study <- data.frame(
  arm = factor(rep(c("control", "intervention"), each = 113)), 
  walking = round(c(rnorm(113, mean = 30, sd = 3), rnorm(113, mean = 70, sd = 5)))
)

p <- ggplot(pilot_study, aes(x=walking, fill=arm, color=arm)) +
  geom_histogram(position="identity", alpha=0.5) + 
  stat_bin(binwidth = 5) + 
  scale_fill_manual(values=c("#46e7fd","#e18b22")) +
  labs(title = "Pilot data", 
       subtitle = "Histogram of self-management scores") + 
  xlab("Disease self-management scores") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

c <- ggplot(clinical_study, aes(x=walking, fill=arm, color=arm)) +
  geom_histogram(position="identity", alpha=0.5) + 
  stat_bin(binwidth = 5) + 
  scale_fill_manual(values=c("#46e7fd","#e18b22")) +
  labs(title = "Synthetic data", 
       subtitle = "Histogram of self-management scores") + 
  xlab("Disease self-management scores") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

p + c

## ---- physical-activity

pilot_study <- data.frame(
  arm = factor(rep(c("control", "intervention"), each = 20)), 
  walking = round(c(rnorm(20, mean = 70, sd = 7), rnorm(20, mean = 90, sd = 5)))
)

clinical_study <- data.frame(
  arm = factor(rep(c("control", "intervention"), each = 113)), 
  walking = round(c(rnorm(113, mean = 70, sd = 7), rnorm(113, mean = 90, sd = 5)))
)

p <- ggplot(pilot_study, aes(x=walking, fill=arm, color=arm)) +
  geom_histogram(position="identity", alpha=0.5) + 
  stat_bin(binwidth = 3) + 
  scale_fill_manual(values=c("#46e7fd","#e18b22")) +
  labs(title = "Pilot data", 
       subtitle = "Histogram of physical activity") + 
  xlab("Physical activity (minutes per week)") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

c <- ggplot(clinical_study, aes(x=walking, fill=arm, color=arm)) +
  geom_histogram(position="identity", alpha=0.5) + 
  stat_bin(binwidth = 3) + 
  scale_fill_manual(values=c("#46e7fd","#e18b22")) +
  labs(title = "Synthetic data", 
       subtitle = "Histogram of physical activity") + 
  xlab("Physical activity (minutes per week)") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

p + c

## ---- age

pilot_study <- data.frame(
  age_band = factor(c(1:4)), 
  frequency = c(5, 7, 12, 16)
)

clinical_study <- data.frame(
  age_band = factor(c(1:4)), 
  frequency = c(28, 39, 68, 91)
)

p <- ggplot(pilot_study, aes(x=age_band, y=frequency)) + 
  geom_bar(color = "#46e7fd", stat = "identity") + 
  labs(title = "Pilot data", 
       subtitle = "Barplot of age bands") + 
  xlab("Age bands") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

c <- ggplot(clinical_study, aes(x=age_band, y=frequency)) + 
  geom_bar(color = "#46e7fd", stat = "identity") + 
  labs(title = "Synthetic data", 
       subtitle = "Barplot of age bands") + 
  xlab("Age bands") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

p + c

## ---- sex

pilot_study <- data.frame(
  sex = factor(c("female", "male")), 
  frequency = c(14, 26)
)

clinical_study <- data.frame(
  sex = factor(c("female", "male")), 
  frequency = c(80, 146)
)

p <- ggplot(pilot_study, aes(x=sex, y=frequency)) + 
  geom_bar(color = "#46e7fd", stat = "identity") + 
  labs(title = "Pilot data", 
       subtitle = "Barplot of sex composition") + 
  xlab("Sex") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

c <- ggplot(clinical_study, aes(x=sex, y=frequency)) + 
  geom_bar(color = "#46e7fd", stat = "identity") + 
  labs(title = "Synthetic data", 
       subtitle = "Barplot of sex composition") + 
  xlab("Sex") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

p + c

## ---- education

pilot_study <- data.frame(
  education = factor(c("low", "moderate", "high")), 
  frequency = c(5, 25, 10)
)

clinical_study <- data.frame(
  education = factor(c("low", "moderate", "high")), 
  frequency = c(28, 141, 57)
)

p <- ggplot(pilot_study, aes(x=education, y=frequency)) + 
  geom_bar(color = "#46e7fd", stat = "identity") + 
  labs(title = "Pilot data", 
       subtitle = "Barplot of education composition") + 
  xlab("Education") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

c <- ggplot(clinical_study, aes(x=education, y=frequency)) + 
  geom_bar(color = "#46e7fd", stat = "identity") + 
  labs(title = "Synthetic data", 
       subtitle = "Barplot of education composition") + 
  xlab("Education") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic"))

p + c
