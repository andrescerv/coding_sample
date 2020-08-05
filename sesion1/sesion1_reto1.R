# SESION 1, RETO 1
# Crea un vector con los números del 1 al 500, de 10 en 10.
c(seq(from = 1, to = 500, by = 10))

# Guarda este vector con el nombre mi.vector
mi.vector <- c(seq(from = 1, to = 500, by = 10))

# ¿Cuál es el tamaño del vector?
length(mi.vector)

# Al último elemento del vector, reemplazalo por el número -1.
mi.vector[length(mi.vector)] <- -1
mi.vector

# Multiplica este vector por 0.85 y sumale 10, guarda el resultado en mi.vector.transformado
mi.vector.transformado <- (mi.vector * 0.85) + 10
mi.vector.transformado

# Ordena el vector mi.vector.transformado descendentemente
sort(mi.vector.transformado, decreasing = TRUE)
