# SESIÓN 2, EJEMPLO 2

#Cargamos el paquete que nos permitira hacer el ejercicio
library(dplyr)

#Vamos a usar la informacion de mtcars, ya disponible en R
head(mtcars)

#Creamos la variable mtcars para poder hacer operaciones sobre esos datos
mtcars <- mtcars 

#Selecciona las variables nombre del carro, millas por galon y horse power
#Usamos las comillas para que detecte que es una palabra compuesta
select(mtcars, 'nombre carro', mpg, hp) 

#Filtra por aquellos vehiculos que tengan hp mayor a 200 y su nombre contenga la letra "a"
filter(mtcars, grepl("a", 'nombre carro') & hp > 200 )
?grepl
