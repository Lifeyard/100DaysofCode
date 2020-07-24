#Installing packages
install.packages("dplyr")
install.packages("ggplot2")
install.packages("lattice")
install.packages("wesanderson")
install.packages("tidyr")
install.packages("magritttr")
install.packages("ggfortify")
install.packages("gridExtra")
install.packages("tidyverse")

rm(list = ls())

#Libraries
library(dplyr)
library(ggplot2)
library(ggfortify)
library(lattice)
library(wesanderson)
library(tidyr)
library(magrittr)
library(ggfortify)
library(gridExtra)
library(tidyverse)
data()
View(starwars)

#Selecting the variables gender, height, mass and species. Filtering all species that are not human. 
#omitting missing values (NA), changing height (cm) to meters. Calculating BMI, grouping by gender and 
#finding the average BMI for males and females. 

starwars %>%  
  select(gender, height, mass, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  mutate(BMI = mass / height^2) %>%  
  group_by(gender) %>% 
  summarise(Aaverage_BMI = mean(BMI))

#Males are slightly overweight. 

#Renaming mass to weight.

starwars %>% 
  select(everything()) %>% 
  rename(weight = mass)

#Creating a new dataset from the original one

sw <- starwars %>% 
  select(name, mass, height, gender) %>% 
  rename(weight = mass) %>% 
  na.omit() %>%  
  mutate(height = height/100) %>% 
  filter(gender %in% c("masculine", "feminine")) %>% 
  mutate(gender = recode(gender, 
                         masculine = "m",
                         feminine = "f"))
sw

