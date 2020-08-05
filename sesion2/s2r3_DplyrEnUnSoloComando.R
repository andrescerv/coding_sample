# SESIÓN 2, RETO 3: Dplyr
# https://github.com/beduExpert/A2-Estadistica-Programacion-con-R-2020/tree/master/Sesion-02/Reto-03

#OBJETIVO
  # Usar el package dplyr para optimizar codigo
  # Hacer un recuento de una variable (funcion count) y ordenar por orden alfabetico (funcion arrange)

# DESARROLLO
# Sobre la tabla de ecobici que ya estamos trabajando, 
df.ecobici.simple

# crearemos un comando optimizado de varias ordenes apoyandote de la funcion %>%. 
# La primera orden sera un recuento de las estaciones que hay en cada colonia (hint: count). 
df.ecoboci.colonias <- df.ecobici.simple %>%
  group_by(Colonia) %>%
  count() %>%
  rename(Cicloestaciones = n)

# A continuacion pediremos que se ordenen alfabeticamente por nombre de la Colonia.
df.ecoboci.colonias %>%
  arrange(Colonia)

df.ecoboci.colonias %>%
  arrange(desc(Cicloestaciones)) # aquí ordeno a las colonias por su número de cicloestaciones
