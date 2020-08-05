# SESIÓN 2, RETO 2
# https://github.com/beduExpert/A2-Estadistica-Programacion-con-R-2020/blob/master/Data/ecobici.xls

# Programacion con objetos
# OBJETIVO
  # Usar el package dplyr para optimizar codigo
  # Importar un fichero de una ruta con la funcion read_excel
  # Evaluar las variables que contiene la tabla y filtrarlas con la funcion select

# Importamos la tabla Dataset_Ecobici_xls con la que trabajaremos (hint: read_excel). 
install.packages("readxl")
library("readxl")

getwd()
setwd('C:/Users/lenovo/OneDrive/career growth/data science/BEDU/data/R')

df.ecobici <- read_excel('ecobici.xls')
head(df.ecobici)

# A nuestra tabla la llamaremos "ecobici".


# Observaremos la calidad de los datos importados 
str(df.ecobici)

# y seleccionaremos las variables mas importantes para el analisis (hint: select).
library(dplyr)
df.ecobici.simple <- df.ecobici %>%
  select(Nombre, Colonia, nearbyStations, punto_geo) 

df.ecobici.simple
  head()
