getwd()
setwd('C:/Users/lenovo/OneDrive/career growth/data science/BEDU/data/R')

df.dataframe = read.csv('Metro_Interstate_Traffic_Volume.csv')

str(df.dataframe)

# Veamos los distintos niveles de la columna holiday
unique(df.dataframe$holiday)
levels(df.dataframe$holiday)

# Ordenar niveles
niveles.orden <- c('Christmas Day','Columbus Day','Independence Day','Labor Day','Martin Luther King Jr Day',
                   'Memorial Day','New Years Day','None','State Fair', 'Thanksgiving Day', 'Veterans Day',
                   'Washingtons Birthday')

# Agregamos columna con los niveles ordenados
df.dataframe$holiday_orden <- factor(x = df.dataframe$holiday, levels = niveles.orden, ordered = TRUE)

# Veamos que cambió en nuestro dataframe
str(df.dataframe)

unique(df.dataframe$holiday_orden)
levels(df.dataframe$holiday_orden)
