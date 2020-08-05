#SESION 1, RETO 3
#Imprime el dataframe precargado en R mtcars
mtcars
data(mtcars)

#Pide ayuda para ver la descripción del dataframe. Hint: usa ?
? mtcars

#Responde: ¿Cuál es el máximo de la columna cyl?
max(mtcars$cyl)

#Responde: ¿Cuál es el mínimo de la columan qsec?
min(mtcars$qsec)

#Guarda el promedio de la columna cyl en mean.cyl
mean.cyl <- mean(mtcars$cyl)
mean.cyl # 6.1875

#Guarda el promedio de la columna qsec en mean.qsec
mean.qsec <- mean(mtcars$qsec)
mean.qsec # 17.84875

#Selecciona los renglones que tengan cyl mayor al promedio (mean.cyl)
mtcars[mtcars$cyl > mean.cyl, ]

#Selecciona los rengloens que tengan cyl mayor al promedio (mean.cyl) y qsec mayor al promedio (mean.qsec)
mtcars[mtcars$cyl > mean.cyl & mtcars$qsec > mean.qsec, ]

#Guarda la última instruccion en un dataframe que tenga el nombre mtcars.filtrados
mtcars.filtrados <- mtcars[mtcars$cyl > mean.cyl & mtcars$qsec > mean.qsec, ]

(c(-1,0,1) >= 0) & (c(-1,0,1) <= 0)
(c(-1,0,1) >= 0) && (c(-1,0,1) <= 0)