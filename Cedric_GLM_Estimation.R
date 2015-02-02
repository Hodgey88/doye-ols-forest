# Set working directory to where data is saved
setwd("~/Documents/Kaggle/Forest_Project")

# Load libraries
library(dplyr)
library(ggplot2)

# Read in training data set
train.df <- read.csv("train_cleaned.csv")
attach(train.df)
train.tble <- tbl_df(train.df)

# Convert to factor variables
train.tble$wildarea <- factor(train.tble$wildarea)
train.tble$soiltype <- factor(train.tble$soiltype)
train.tble$Cover_Type <- factor(train.tble$Cover_Type)

# Doing really fancy statistics
glm_ftw <- glm(Cover_Type ~ soiltype + Elevation + Slope, family = gaussian)

# Showing how good the fancy statistics worked (or didn't)
glm_ftw
summary(glm_ftw)
plot(glm_ftw)
