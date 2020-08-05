# SESION 1, RETO 6
# Lee el archivo Metro_Interstate_Traffic_Volume.csv
getwd()
df.dataframe = read.csv('Metro_Interstate_Traffic_Volume.csv')

# Ve la estructura del dataframe
str(df.dataframe)

# ¿Cuáles son los niveles de la columna weather_main?
levels(df.dataframe$weather_main)

# Reordena los niveles alfabéticamente
unique(df.dataframe$weather_main)
levels.order = sort(unique(df.dataframe$weather_main))

# Agrega una columna llamada weather_main_ordered al dataframe, donde los niveles estén ordenados
df.dataframe$weather_main_ordered <- factor(x = df.dataframe$weather_main, levels = levels.order, ordered = TRUE)
str(df.dataframe)

df.dataframe$weather_main_ordered <- factor(x = sort(unique(df.dataframe$weather_main)), ordered =  TRUE)