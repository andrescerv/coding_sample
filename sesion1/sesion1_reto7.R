# SESIÓN 1, RETO 7

#Haz un llamado a la libreria dplyr
library(dplyr)
?select

#Lee el archivo Metro_Interstate_Traffic_Volume.csv y guardalo en df.traffic
getwd()
setwd('C:/Users/lenovo/OneDrive/career growth/data science/BEDU/data/R')
df.traffic <- read.csv('Metro_Interstate_Traffic_Volume.csv')

#Ve la estructura del dataframe y los tipos de dato de cada columna
str(df.traffic)

#Calcula el promedio de la columna traffic_volume y guardala en mean.traffic
mean.traffic <- mean(df.traffic$traffic_volume)

#Selecciona solo las columnas weather_main y traffic_volume
df.traffic %>%
  select(weather_main, traffic_volume) %>%
  head(5)

#Cambia de nombre las columnas: weather_main a clima y traffic_volume a trafico
df.traffic %>%
  rename(clima = weather_main, trafico = traffic_volume) %>%
  head(5)
?rename

#Filtra a las observaciones donde la columna trafico sea mayor o igual a mean.traffic
df.traffic %>%
  filter(traffic_volume >= mean.traffic) %>%
  head(5)

? filter

#Guarda el dataframe filtrado como df.traffic.filter
df.traffic.filter <- df.traffic %>% filter(traffic_volume >= mean.traffic)

#¿Cuántos renglones y columnas tiene df.traffic.filter?
nrow(df.traffic.filter)
ncol(df.traffic.filter)
dim(df.traffic.filter)

#  Con df.traffic.filter, agrupa por clima y saca el min de trafico y max de trafico, guardalo en df.traffic.grouped
df.traffic.grouped <- df.traffic.filter %>%
                      group_by(weather_main) %>%
                      summarise( mean.traffic = mean(traffic_volume),
                                 max.traffic = max(traffic_volume),
                                 min.traffic = min(traffic_volume))

df.traffic.grouped

#Agrega una columna a df.traffic.grouped que sea la diferencia entre max y min del grupo
df.traffic.grouped %>%
  mutate(dif.traffic = max.traffic - min.traffic)
