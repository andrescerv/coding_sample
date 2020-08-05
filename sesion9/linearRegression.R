library(dplyr)
library(ggplot2)

cars

cars %>% head(5)

str(cars)
summary(cars)
dim(cars)

cor(cars)

# una línea que suaviza la relación
scatter.smooth(x = cars$speed,
               y = cars$dist,
               main = 'Relación distancia / velocidad')

# Ajustamos un modelo de regresión lineal
  # en general: lm(y ~ x, data)

modlin <- lm(dist ~ speed, data = cars)
modlin # el resultado arroja y =3.932x - 17.579 (fórmula de cualquier recta)
  # dist = -17.579 + 3.932*speed
summary(modlin)

# se guardan los coeficientes
b_0 <- modlin$coefficients[1]
b_1 <- modlin$coefficients[2]

x_new <- 26
y_new <- b_0 + b_1*x_new

# función para predict
predict(modlin, data.frame(speed = c(26)))
predict(modlin, data.frame(speed = c(26,30,42,57)))        

# graficas
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point() +
  theme_minimal() +
  ggtitle('Linear regression of R dataset "cars"')

# reto: trazar la linea resultante de la regresión lineal
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point() +
  theme_minimal() +
  ggtitle('Linear regression of R dataset "cars"') +
  geom_smooth(method = 'lm', se = FALSE)

ggplot(cars, aes(x = speed, y = dist)) +
  geom_point() +
  theme_minimal() +
  ggtitle('Linear regression of R dataset "cars"') +
  geom_abline(intercept = b_0, slope = b_1)
