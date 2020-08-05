#creando variables
ingreso.mensual <- 5
ingreso.mensual
variable.char<- 'hola R'

class(variable.char)
class(ingreso.mensual)
variable.logical<-1
class(variable.logical)

c(1,2,3,4)
list(1,'andi',TRUE,c(1,2,3,4))

# creando vectores
vector.edades <- c(10,11,15,22,45,3)
vector.nombres <- c('Ana','Salvador','Andres','Romel','Metzgerei','Tintin')  

class(vector.nombres)
class(vector.edades)

vector.nombres.nuevos <- c('Edgar','Hazael')

vector.nombres <- c(vector.nombres, vector.nombres.nuevos)

# creando vector con secuencia
vector.seq.bytwo <- seq(from=1, to=10, by=2)
seq(from=-5, to=999, by=5)

# creando vector con rep
rep(x=1, times=100)
rep(x=c(1,2,3), each = 3)
rep(x = c (1,2,3), each = 2, times = 3)
rep(x = c (1,2,3), each = 3, times = 2)
# el orden de each y times NO afecta el resultado
rep(x = c (1,2,3), times = 2, each = 3)

# ordenando vectores
sort(vector.nombres)
sort(vector.edades, decreasing = TRUE)

# para ver el tamaño de un vector
length(vector.nombres)

# operaciones en vectores
vector.edades * 5

# extrayendo elementos de vectores
vector.lengthy.vector <- rep ( x = seq(from = 0, to = 1000, by = 5), each = 3)
vector.lengthy.vector[0]
vector.lengthy.vector[1]
vector.lengthy.vector[1:3]
vector.lengthy.vector[1:4]
  # extrayendo el último elemento del vector
  vector.lengthy.vector[length(vector.lengthy.vector)]
  vector.lengthy.vector[-length(vector.lengthy.vector)]  
  