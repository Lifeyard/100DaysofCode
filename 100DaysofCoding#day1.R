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

names(compensation)
head(compensation)
tail(compensation)
dim(compensation)
#So my dataset has 40 rows and 3 columns
str(compensation)
#Avoid typinig the name of my dataset to get info (too cumbersome if too many observations and variables)
glimpse(compensation)
summary(compensation)
#Summary allows me to see if there are unexpected values (extremes or impossible values)

#Checking what variables I have and selecting the last one
names(compensation)
select(compensation, Grazing)
#Now I want to select all columns except the first one
names(compensation)
select(compensation, - Root)
#Now I want to select (with slice) the last row of my dataset. First I need to know what number the last row is.
str(compensation)
#I have 40 observations, so the last row is the 40th
slice(compensation, 40)
#Now I want to slice in discontinuation
slice(compensation, c(12, 22, 38))

#Now I want to see all fruits that are smaller than 60. This is the filter function but we don't use a command called filter.
small_fruits <- with(compensation, Fruit < 60)
#Now I want to check if it matches my dataset
head(compensation)

######Testing myself#######
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
ladybirds <- read.csv("D:\\Unine\\Unine\\Lessons\\5ème semestre\\Biostatistiques\\ladybirds.csv")
str(ladybirds)
glimpse(ladybirds)
summary(ladybirds)
ladybirds
select(ladybirds, c(Habitat, colour))
with(ladybirds, number < 13)

#Now for the 12 last minutes, I'll summarise the names of the functions I've worked with:
#name: gives the names of the columns (variables)
#head and tail give the first or last 6 observations of my dataset
#dim give me the dimension of my dataframe. First value is the observations, 2nd is the columns
#str gives me the dimensions of my dataset, and the variables as well as their levels
#glimps gives me the dimensions, the variables and the first values for each variable. Unlike "str", it doesn't
#give me the levels for each variable. 
#summary shows me the quartils, the mean and median
#slice allows me to select rows 
#select allows me to select columns
#with allows me to filter and give me booleans (TRUE or FALSE)