
# Para ver la ruta de dónde estamos trabajando
getwd()

# Para bajar dos niveles del directorio de trabajo 
# utilizamos ../.. y para accesar a una nueva carpeta ponemos su nombre, Data
setwd('C:/Users/lenovo/Documents/BEDU/project/data')

# Vemos la ruta cambiada
getwd()

# Podemos leer un archivo que esta en internet
dataframe.traffic.2 <- read.csv('https://raw.githubusercontent.com/beduExpert/A2-Estadistica-Programacion-con-R-2020/master/Data/Metro_Interstate_Traffic_Volume.csv', 
                                header =  TRUE)
read.csv('https://raw.githubusercontent.com/beduExpert/A2-Estadistica-Programacion-con-R-2020/master/Data/Metro_Interstate_Traffic_Volume.csv')
