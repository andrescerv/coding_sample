library(dplyr)
library(ggplot2)
library(plotly)

? longley # A macroeconomic data set which provides a well-known example for a highly collinear regression.
head(longley)
summary(longley)
dim(longley)
cor(longley)

longley %>%
  select(GNP, Employed)

# Reto: ajustar un modelo de regresión lineal al dataset longley
  # donde y = Employed, x = GNP
  # hacer predict con x = 75
  # graficar con plotly los puntos y la linea resultante

modlin <- lm(Employed ~ GNP, data = longley)
b_0 <- modlin$coefficients[1]
b_1 <- modlin$coefficients[2]

predict(modlin, data.frame(GNP = c(75,200,300,400,500,600)))

ggplotly(
  ggplot(longley, aes(x = GNP, y = Employed)) +
    geom_point() +
    theme_minimal() +
    ggtitle('Linear regression of R dataset "longley"') +
    geom_smooth(method = 'lm', se = FALSE)
)

#------------------------------------------------------------------
# Modelo de regresión lineal múltiple
lm(Employed ~ GNP.deflator + GNP + Unemployed + Armed.Forces + Population , data = longley)
lm_longley <- lm(Employed ~ ., data = longley) # se usa el '.' para tomar todas las variables
lm_longley
summary(lm_longley)

# Reto: ajustar un modelo de regresión lineal múltiple donde utilicen 
  # todas las variables, menos Employed para crear un modelo lineal.
  # Dar una predicción para x1=120, x2=500, x3=500, x4=300, x5=100, x6=1960
predict(lm_longley, data.frame(GNP.deflator = c(120), 
                               GNP = c(500),
                               Unemployed = c(500),
                               Armed.Forces = c(300),
                               Population = c(100),
                               Year = c(1960)))
