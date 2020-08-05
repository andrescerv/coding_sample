# SESIÓN 2, EJEMPLO 1
# cargar csv mtcars
mtcars

# desplegar la estructura del dataset e 
# identificar los valores int que podrían ser variables de tipo lógico
str(mtcars)
class(mtcars$vs)

# Cambiaremos las variables con valores 1 y 0, por un tipo de dato logico
mtcars$vs = as.logical(mtcars$vs)
mtcars$am = as.logical(mtcars$am)
class(mtcars$vs)
class(mtcars$am)

# mostrar un resumen estadistico del DataSet
summary(mtcars)

# transformar 'wt' de 1000 libras a kg
data("mtcars")
mtcars.new <- transform(mtcars, wt = wt * 1000 * 0.453592)
?transform()
mtcars$wt
mtcars.new$wt

library(dplyr)
mtcars.new %>%
  select(wt) %>%
  head(5)
