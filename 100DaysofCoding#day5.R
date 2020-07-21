#Installing packages
install.packages("dplyr")
install.packages("ggplot2")
install.packages("lattice")
install.packages("wesanderson")
install.packages("tidyr")
install.packages("magritttr")
install.packages("ggfortify")
install.packages("gridExtra")

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

file.choose()
plantgrowth <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\plant.growth.rate.csv")
glimpse(plantgrowth)
head(plantgrowth)
str(plantgrowth)

plantplot <- ggplot(plantgrowth, aes(x = soil.moisture.content, y = plant.growth.rate))+
  geom_point()+
  xlab("soil moisture")+
  ylab("plant growth rate (mm/week)")+
  theme_bw()
plantplot

model_plantgrowth <- lm(soil.moisture.content ~ plant.growth.rate, data = plantgrowth)
model_plantgrowth

autoplot(model_plantgrowth, smooth.colour = NA)
anova(model_plantgrowth)
summary(model_plantgrowth)

#Soil moisture had a positive effect on plant growth. For each unit increase in
#soil moisture, plant growth rate increased by 12.7 mm/week (slope = 12.7, t = 12.5, d.f. = 48, p < 0.001).

ggplot(plantgrowth, aes(x = soil.moisture.content, y = plant.growth.rate))+
  geom_point()+
  geom_smooth(method = lm)+
  ylab("plant growth rate")+
  theme_bw()

#--------------------------------------------------------

file.choose()
Daphnia <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\Daphniagrowth.csv")
str(Daphnia)
head(Daphnia)

select(Daphnia, parasite)

ggplot(Daphnia, aes(x = parasite, y = growth.rate, colour = parasite))+
  geom_boxplot()+
  xlab("parasites")+
  ylab("growth rate")+
  coord_flip()+
  theme_bw()

#Estimating the average growth rate per parasite

Daphnia %>% 
  group_by(parasite) %>%
  summarise(mean_growth = mean(growth.rate))

#Performing a one-way anova

model_parasite <- lm(growth.rate ~ parasite, data = Daphnia)
autoplot(model_parasite, smooth.colour = NA)
anova(model_parasite)
summary(model_parasite)
