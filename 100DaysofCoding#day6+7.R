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
growth.moo <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\growth.csv")
str(growth.moo)

#Checking out the levels

levels(growth.moo$diet)
levels(growth.moo$supplement)

#Let's relevel to make "control" the reference

growth.moo <- mutate(growth.moo, 
                     supplement = relevel(supplement, ref = "control"))

#Calculating the mean of gain according to diet and supplement

mean_growth <- growth.moo %>%
  group_by(diet, supplement) %>%
  summarise(mean_gain = mean(gain))

#Plotting 

ggplot(mean_growth, aes(x = supplement, y = mean_gain, colour = diet, group = diet))+
  geom_point()+
  geom_line()+
  theme_bw()

#X^2 and ladybugs

rm(list =ls())

file.choose()
ladybugs <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\ladybirds_morph_colour.csv")
str(ladybugs)

sumLady <- ladybugs %>%
  group_by(Habitat, morph_colour) %>%
  summarise(sum_number = sum(number))
sumLady

ggplot(sumLady, aes(x = Habitat, y = sum_number, fill = morph_colour))+ 
  geom_bar(stat = "identity", position = "dodge")+
  xlab("Habitat")+
  ylab("quantity")+
  scale_fill_manual(values = c(black = "black", red = "red"))+
  theme_bw()

ladymat <- xtabs(number~Habitat+morph_colour, 
                 data = ladybugs)
chisq.test(ladymat)

#two-sample t-test and ozone

rm(list = ls())
file.choose()
ozone <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\ozone.csv")
str(ozone)
head(ozone)

ggplot(ozone, aes(x = Ozone))+
  geom_histogram(binwidth = 10)+
  facet_wrap(~Garden.location, ncol = 1)
  theme_bw()
