library(tidyverse) 
library(caret) 
library(ggcorrplot) 
library(reshape2) 
library(tidyverse)
library(dplyr)


# Load dataset
df <- read.csv("Airline Reviews.csv", stringsAsFactors = TRUE)