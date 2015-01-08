# Set working directory to where data is saved
setwd("C:/Users/linus/Dropbox/Kaggle/Forest Cover")

# Load libraries
library(dplyr)
library(ggplot2)
library(tidyr)

# Read in training data set
train.df <- read.csv("train.csv")

train.tble <- tbl_df(train.df)

# Before any analysis clean we clean up the data. There are two problems, wilderness area and soil type are spread
# out over a large number of columns. Solution is to create two new variables: wildarea and soiltype.

# Create new wilderness area variables

        # Create temporary data set with the current four wilderness area variables
        temp.data <- select(train.tble, Wilderness_Area1:Wilderness_Area4)

        # Loop through each column and multiply by value between 1 and 4
        for(i in 1:ncol(temp.data))
                temp.data[,i] <- temp.data[,i]*i

        # Create new variable equal to sum of modified variables
        train.tble <- train.tble %>% mutate(wildarea = apply(temp.data, 1, sum))        

        # These are used to test that the above method works
        # sapply(select(train.tble, Wilderness_Area1:Wilderness_Area4), sum)
        # table(train.tble$wildarea)

# Create new wilderness area variables

        # Create temporary data set with the current 40 soil types
        temp.data <- select(train.tble, Soil_Type1:Soil_Type40)
        
        # Loop through each column and multiply by value between 1 and 40
        for(i in 1:ncol(temp.data))
                temp.data[,i] <- temp.data[,i]*i
        
        # Create new variable equal to sum of modified variables
        train.tble <- train.tble %>% mutate(soiltype = apply(temp.data, 1, sum))        
        
        # These are used to test that the above method works
        # sapply(select(train.tble, Soil_Type1:Soil_Type40), sum)
        # table(train.tble$soiltype)

train.tble <- train.tble %>% select(-(Wilderness_Area1:Wilderness_Area4),-(Soil_Type1:Soil_Type40)) 

write.csv(train.tble, "train_cleaned.csv")

