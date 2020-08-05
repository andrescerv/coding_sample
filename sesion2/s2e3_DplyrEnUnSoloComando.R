# SESION 2, EJEMPLO 3: Dplyr en un solo comando
# https://github.com/beduExpert/A2-Estadistica-Programacion-con-R-2020/tree/master/Sesion-02/Ejemplo-03

# OBJETIVO
  # Aprenderas a usar dplyr
  # Aprenderas a crear una orden compleja en un solo comando de codigo

# DESARROLLO
#Con la ayuda del package dplyr, haremos los siguientes comandos con una sola orden (Hint: usar "%>%")
library(dplyr)

#Usa la base de datos precargada llamada iris 
head(iris)
iris <- iris # Guardo la tabla en la memoria de objetos

# y calcula la media de la sepal.length y la sepal.width segun la especie. 
# Finalmente, ordena los resultados alfabeticamente segun la especie.
iris %>% # Datos que usare
  group_by(Species) %>% # Variable de agrupacion
  summarise(Media_Sepal_Length = mean(Sepal.Length), # Media de sepal length
            Media_Sepal_Width = mean(Sepal.Width)) %>% # Media de sepal width
  arrange(Species) # Ordenar por especies (por defecto es orden ascendiente)


