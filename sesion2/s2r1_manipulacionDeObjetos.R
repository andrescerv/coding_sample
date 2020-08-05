# SESIÓN 2, RETO 1
# OBJETIVO
  #Importación de un dataset
  #Cambiar los valores de un objeto

# Importamos el dataset de Spotify_csv, 
setwd("C:/Users/lenovo/OneDrive/career growth/data science/BEDU/data/R")
df.spotify <- read.csv('C:/Users/lenovo/OneDrive/career growth/data science/BEDU/data/R/spotify.csv')

head(df.spotify)  

  # desplegaremos su estructura 
str(df.spotify)

  # e identifiaremos la variable del tiempo que se encuentra en ms , 
library(dplyr)
df.spotify %>%
  select(tempo) %>%
  head()
  
  # se realizaran las operaciones necesarias para convertir el valor a minutos
df.spotify <- transform(df.spotify, tempo = tempo/60)
df.spotify %>%
  select(tempo) %>%
  head()

head(df.spotify)
