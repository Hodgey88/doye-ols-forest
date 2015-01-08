# Set working directory to where data is saved
setwd("C:/Users/linus/Dropbox/Kaggle/Forest Cover")

# Load libraries
library(dplyr)
library(ggplot2)

# Read in training data set
train.df <- read.csv("train_cleaned.csv")
train.tble <- tbl_df(train.df)

# Convert to factor variables
train.tble$wildarea <- factor(train.tble$wildarea)
train.tble$soiltype <- factor(train.tble$soiltype)
train.tble$Cover_Type <- factor(train.tble$Cover_Type)

# Frequency  cover type by wilderness area type
by_warea <- train.tble %>% group_by(wildarea, Cover_Type) %>% summarise(n = n()) %>% mutate(freq = n / sum(n))

by_warea %>% ggplot(aes(y = freq, x = Cover_Type, fill=wildarea)) +
        geom_bar(stat="identity") + facet_grid(.~wildarea)


# Single variable jitter plots 
train.tble %>% ggplot(aes(y=Cover_Type, x=wildarea, color=Cover_Type))+geom_jitter(alpha=0.1)

train.tble %>% ggplot(aes(y=Cover_Type, x=soiltype, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Elevation, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Slope, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Horizontal_Distance_To_Hydrology, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Aspect, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Vertical_Distance_To_Hydrology, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Horizontal_Distance_To_Roadways, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Hillshade_9am, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Hillshade_Noon, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Hillshade_3pm, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Cover_Type, x=Horizontal_Distance_To_Fire_Points, color=Cover_Type))+geom_jitter(alpha=0.2)

# Multivariate jitter plots
train.tble %>% ggplot(aes(y=soiltype, x=Elevation, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=soiltype, x=Slope, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Horizontal_Distance_To_Fire_Points, x=Horizontal_Distance_To_Roadways, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Horizontal_Distance_To_Fire_Points, x=Elevation, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Horizontal_Distance_To_Fire_Points, x=Slope, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Horizontal_Distance_To_Fire_Points, x=Aspect, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Elevation, x=Slope, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Hillshade_9am, x=Slope, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Hillshade_Noon, x=Slope, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Hillshade_3pm, x=Slope, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Hillshade_9am, x=Elevation, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Hillshade_Noon, x=Elevation, color=Cover_Type))+geom_jitter(alpha=0.2)

train.tble %>% ggplot(aes(y=Hillshade_3pm, x=Elevation, color=Cover_Type))+geom_jitter(alpha=0.2)
