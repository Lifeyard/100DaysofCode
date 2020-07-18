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

#Adding a column LogFruit where I have the log of the value for each fruit
compensation <- mutate(compensation, Logfruit = log(Fruit))
head(compensation)

#Viewing my dataframe - the column Fruit
select(compensation, - Fruit)

#Arranging fruits in increasing values
arrange(compensation, Fruit)

#Using 2 functions in a single line. Reading from the inside out, I'm asking R to arrange the Root column in order of increasing
#values, then I ask it to select this column. 
select(arrange(compensation, Root), Root)

#Using pipes to select all the fruits that have a value bigger than 80 with filter, then selecting the roots column for these fruits only
compensation %>%
  filter(Fruit > 80) %>%
  select(Root)

#Making a summary (with summarise) of the mean of the fruits that were grazed and ungrazed using group_by

compensation %>%
  group_by(Grazing) %>%
  summarise(meanFruit = mean(Fruit)) 

#Plotting Roots and Fruits
head(compensation)
compensation_plot <- ggplot(compensation, aes(x = Root, y = Fruit, colour = Grazing ))+ 
geom_point(size = 2)+
  xlab("Root biomass")+
  ylab("Fruit production")+
  theme_bw()

compensation_plot


