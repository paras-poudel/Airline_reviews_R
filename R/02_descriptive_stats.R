# View the first few rows
head(df)

# Check the structure of the data
str(df)

# Summary of dataset
summary(df)

# Check missing values
colSums(is.na(df))

# Handle missing values using mean
#----------------------------------
  
df$Age[is.na(df$Age)] <- mean(df$Age, na.rm = TRUE)
df$Seat.comfort[is.na(df$Seat.comfort)] <- mean(df$Seat.comfort, na.rm = TRUE)
df$Food.and.drink[is.na(df$Food.and.drink)] <- mean(df$Food.and.drink, na.rm = TRUE)
df$Gate.location[is.na(df$Gate.location)] <- mean(df$Gate.location, na.rm = TRUE)
df$Baggage.handling[is.na(df$Baggage.handling)] <- mean(df$Baggage.handling, na.rm = TRUE)
df$Inflight.entertainment[is.na(df$Inflight.entertainment)] <- mean(df$Inflight.entertainment, na.rm = TRUE)
df$Ease.of.Online.booking[is.na(df$Ease.of.Online.booking)] <- mean(df$Ease.of.Online.booking, na.rm = TRUE)
df$Arrival.Delay.in.Minutes[is.na(df$Arrival.Delay.in.Minutes)] <- 
  mean(df$Arrival.Delay.in.Minutes, na.rm = TRUE)

# Generate group-wise summary statistics to examine differences in average ratings and demographic features between satisfied and dissatisfied customers.
#--------------------------------------------------------------------------------------------------------------------------------------------------------
  
df %>%
  group_by(Satisfaction) %>%
  summarise(
    Count = n(),
    Avg_Age = round(mean(Age, na.rm = TRUE), 1),
    Avg_Seat_Comfort = round(mean(Seat.comfort, na.rm = TRUE), 2),
    Avg_Entertainment = round(mean(Inflight.entertainment, na.rm = TRUE), 2),
    Avg_OnlineBoarding = round(mean(Online.boarding, na.rm = TRUE), 2),
    Avg_FlightDistance = round(mean(Flight.Distance, na.rm = TRUE), 0)
  )

#Count Satisfaction Values
#-------------------------
  
df %>%
  count(Satisfaction)

' 1. Overall Satisfaction Trend'
#-------------------------------------------------

# Satisfaction distribution
ggplot(df, aes(x = Satisfaction, fill = Satisfaction)) +
  geom_bar() +
  labs(title = "Overall Customer Satisfaction", y = "Number of Passengers") +
  theme_minimal()

' 2. Satisfaction by Travel Class and Type'
#-------------------------------------------------

# Class-wise satisfaction
ggplot(df, aes(x = Class, fill = Satisfaction)) +
  geom_bar(position = "fill") +
  labs(title = "Satisfaction by Travel Class", y = "Proportion") +
  scale_y_continuous(labels = scales::percent)


# Type of travel (Personal vs. Business)
ggplot(df, aes(x = Type.of.Travel, fill = Satisfaction)) +
  geom_bar(position = "fill") +
  labs(title = "Satisfaction by Travel Purpose", y = "Proportion") +
  scale_y_continuous(labels = scales::percent)



'3. Impact of Delays'
#-------------------------------------------------

# Departure Delay vs Satisfaction
ggplot(df, aes(x = Departure.Delay.in.Minutes, fill = Satisfaction)) +
  geom_histogram(bins = 30) +
  facet_wrap(~Satisfaction) +
  labs(title = "Departure Delay and Satisfaction", x = "Departure Delay (min)", y = "Count")

# Arrival Delay Boxplot
ggplot(df, aes(x = Satisfaction, y = Arrival.Delay.in.Minutes, fill = Satisfaction)) +
  geom_boxplot() +

  labs(title = "Arrival Delay by Satisfaction", y = "Arrival Delay (min)")
