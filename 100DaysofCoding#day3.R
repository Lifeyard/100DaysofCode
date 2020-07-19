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
compensation <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\compensation.csv")
head(compensation)
str(compensation)

ggplot(compensation, aes(x = Root, y = Fruit, colour = Grazing))+
       xlab("Root biomass")+
       ylab("Fruit production")+
  theme_bw()+
       geom_point()

ggplot(compensation, aes(x = Grazing, y = Fruit, colour = Grazing))+
  xlab("Root biomass")+
  ylab("Fruit production")+
  geom_boxplot()+
  geom_point(alpha = 0.5)+
  theme_bw()

ggplot(compensation, aes(x = Fruit))+
  geom_histogram(bins = 20)

compensation %>%
  select(Fruit) %>%
  arrange(Fruit)

ggplot(compensation, aes(x = Fruit))+
  geom_histogram(bins = 15)+
  facet_wrap(~Grazing)

rm(list = ls())

file.choose()
ladybirds <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\ladybirds_morph_colour.csv")
head(ladybirds)
str(ladybirds)

total <- ladybirds %>%
  group_by(Habitat, morph_colour) %>%
  summarise(total_ladybirds = sum(number))
total

ggplot(total, aes(x = Habitat, y = total_ladybirds, fill = morph_colour))+
  geom_bar(stat = 'identity', position = 'dodge')+
  theme_bw()
