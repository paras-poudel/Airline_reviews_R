'Logistic Regression'
#-------------------------------------------------
  
# Convert satisfaction to binary
df$Satisfaction_binary <- ifelse(df$Satisfaction == "satisfied", 1, 0)
        
# Logistic regression
model <- glm(Satisfaction_binary ~ `Seat.comfort` + `Food.and.drink` + `Inflight.entertainment` +
              `Ease.of.Online.booking` + `Baggage.handling` + `Online.boarding` +
             `Departure.Delay.in.Minutes` + `Flight.Distance`, data = df, family = "binomial")
        
options(scipen = 999)
summary(model)