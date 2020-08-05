getwd()
breast.cancer <- read.csv('breast_cancer.csv')
head(breast.cancer)

breast.cancer <- read.csv('https://raw.githubusercontent.com/analuisaortega/BEDU-R-2020/master/Data/breast_cancer.csv')

# análisis superficial del DF
head(breast.cancer)
names(breast.cancer)
str(breast.cancer)
summary(breast.cancer)

# buscar valores nulos
sum(is.na(breast.cancer$diagnosis))
for (i in 0:ncol(breast.cancer)) {
  print(sum(is.na(breast.cancer[,i])))
} # ninguna columna presenta valores nulos

# selecciona variables de interes
wanted.cols <- c('id','diagnosis','radius_mean','perimeter_mean','radius_worst','perimeter_worst')
breast.cancer.filter <- breast.cancer[,wanted.cols]

interest.col <- breast.cancer.filter$radius_mean

# install.packages('modeest')
library(modeest)

mean(interest.col)
median(interest.col)
mlv(interest.col)

sort(interest.col)

### MEDIDAS DE DISPERSIÓN
# varianza y desviación estándar
var(interest.col)
sd(interest.col)
sd(interest.col)**2 == var(interest.col)
# rango
max(interest.col) - min(interest.col)
ceiling(max(interest.col) - min(interest.col))

### DISTRIBUCIÓN
quantile(interest.col)
quantile(interest.col, c(1/3, 2/3))

# Reto 2: Encontrar los cuartiles para interest.col
quantile(interest.col)
cut(interest.col, breaks = quantile(interest.col))
# Encontrar los deciles para interest.col
quantile(interest.col, c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1))
cut(interest.col, breaks = quantile(interest.col, c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1)))

seq(from = 0, to = 1, by = 0.01)
# Encontrar los percentiles para interest.col
quantile(interest.col, seq(from = 0, to = 1, by = 0.01))
cut(interest.col, breaks = quantile(interest.col, seq(from = 0, to = 1, by = 0.01)))

# Encontrar el rango donde se concentra el 85% de los datos más chicos
quantile(interest.col, c(0, 0.85))
# Encontrar el rango donde se concentra el 68% de los datos más centrales
quantile(interest.col, c((0.5-0.68/2),(0.5+0.68/2)))
