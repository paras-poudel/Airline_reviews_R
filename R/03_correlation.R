'Correlation between Service Quality Features vs Satisfaction'
#-------------------------------------------------

# Grouped mean ratings by satisfaction
df %>%
  group_by(Satisfaction) %>%
  summarise(across(c(Seat.comfort, Food.and.drink, Gate.location,
                     Inflight.entertainment, Ease.of.Online.booking, Baggage.handling),
                   mean, na.rm = TRUE)) %>%
  pivot_longer(-Satisfaction, names_to = "Feature", values_to = "AverageScore") %>%
  ggplot(aes(x = Feature, y = AverageScore, fill = Satisfaction)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(title = "Service Features Compared by Satisfaction")


# Correlation with delay
ggplot(df, aes(x = `Departure.Delay.in.Minutes`, fill = Satisfaction)) +
  geom_histogram(bins = 30) +
  facet_wrap(~Satisfaction) +
  labs(title = "Departure Delays and Satisfaction")

# Correlation Matrix

# Only numeric columns
num_vars <- df %>%
  select_if(is.numeric)

# Correlation matrix
cor_matrix <- cor(num_vars, use = "complete.obs")

# Plot
ggcorrplot(cor_matrix, lab = TRUE, type = "lower", title = "Correlation Between Features")
