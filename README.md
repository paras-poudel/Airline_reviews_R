#  Airline Customer Satisfaction Analysis in R

This project analyzes customer satisfaction data from an airline using R. It includes data cleaning, visualization, statistical analysis, and predictive modeling (logistic regression) to understand what drives passenger satisfaction.

##  Objectives

- Clean and preprocess airline review data
- Analyze factors affecting customer satisfaction
- Visualize satisfaction trends across different categories
- Build a logistic regression model to predict satisfaction


## Key Features

###  Data Cleaning & Preprocessing
- Imputation of missing values using mean for numeric features
- Consistency checks and variable type conversion

### Visualization
- Satisfaction distribution by:
  - Travel class
  - Travel type
  - Departure and arrival delays
  - Service quality metrics (seat comfort, entertainment, etc.)
- Correlation heatmap for numerical features

###  Predictive Modeling
- Binary logistic regression to predict satisfaction
- Key predictors: delay time, service ratings, flight distance

## Requirements

Make sure you have the following R packages installed:

```r
install.packages(c("tidyverse", "caret", "ggcorrplot", "reshape2"))

How to Run
Clone this repo or download it as ZIP.

Open the project in RStudio.

Place the dataset (Airline Reviews.csv) inside the data/ folder.

Run the script scripts/analysis.R.
