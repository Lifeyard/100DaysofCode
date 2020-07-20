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
ladybug <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\ladybirds_morph_colour.csv")
str(ladybug)
head(ladybug)

ladybug_tot <- ladybug %>%
  group_by(Habitat, morph_colour) %>%
  summarise(total = sum(number))
ladybug_tot

ggplot(ladybug_tot, aes(x = Habitat, y = total, fill = morph_colour))+
geom_bar(stat = 'identity', position = 'dodge')+
  scale_fill_manual(values = c(black = "black", red = "red"))

ladymat <- xtabs(number ~ Habitat + morph_colour, data = ladybug)
ladymat

chisq.test(ladymat)

#I tested the hypothesis that there is an association between colour morphs of ladybirds and industrial
#and rural habitats. Ladybird colour morphs are not equally distributed in the two habitats (?? 2 = 19.1, df = 1, p < 0.001), 
#with black morphs being more frequent in industrial habitats and red morphs more frequent in rural habitats

rm(list = ls())

file.choose()
ozone <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\ozone.csv")

str(ozone)
head(ozone)

ggplot(ozone, aes(x = Ozone))+
  geom_histogram(binwidth = 10)+
  facet_wrap(~ Garden.location, ncol = 1)
  xlab("Garden location")+
  theme_bw()
         
moyenneOzone <- ozone %>%
  group_by(Garden.location) %>%
  summarise(moyOzone = mean(Ozone))
moyenneOzone

sdOzone <- ozone %>%
  group_by(Garden.location) %>%
  summarise(SDozone = sd(Ozone))

sdOzone

t.test(Ozone ~ Garden.location, data = ozone)
