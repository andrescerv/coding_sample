# SESION 1, RETO 2
#Imprime el dataframe precargado en R mtcars
mtcars

#Imprime el numero de renglones y columnas del dataframe
dim(mtcars)
nrow(mtcars)
ncol(mtcars)

#Imprime el nombre de las columnas del dataframe
names(mtcars)
#encontrando los nombres de la primera columna (equivalente al ID)
row.names(mtcars)

# Imprime el dato que esta en la tercer columna, quinto renglon del dataframe
mtcars[5,3]

#Imprime todos los renglones de la cuarta y quinta columna
mtcars[4:5,]

#Imprime los primeros 20 renglones de la cuarta y quinta columna
mtcars[1:20,4:5]

#Elimina la segunda columna del dataframe
mtcars[2] <- NULL

#Agregando una nueva columna
mtcars.year <- data.frame(year = rep ( x = seq(from = 2017, to = 2020, by = 1), times = 8))
mtcars.year
mtcars <- cbind(mtcars, mtcars.year)
