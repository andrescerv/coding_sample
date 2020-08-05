# SESION 1, RETO 4
#Imprime tu working directory
getwd()

#Si es necesario, cambia la ruta a la carpeta Data

#Lee el archivo Retail_Store.csv
read.csv('https://raw.githubusercontent.com/beduExpert/A2-Estadistica-Programacion-con-R-2020/master/Data/Retail_Store.csv',
         header = TRUE)

#Guarda el nuevo dataframe como dataframe.retail
dataframe.retail <- read.csv('https://raw.githubusercontent.com/beduExpert/A2-Estadistica-Programacion-con-R-2020/master/Data/Retail_Store.csv',
                     header = TRUE)
head(dataframe.retail)