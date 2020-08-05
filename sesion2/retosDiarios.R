head(iris)

if (iris$Sepal.Length <= 5){
  iris$size = 'small'
} else if (iris$Sepal.Length >= 7){
  iris$size = 'big'
} else {
  iris$size = 'medium'
}

# Reto: crear una nueva columna que se llame category2 y que sea:
  # 'small' si Sepal Length es menor o igual a 5
  # "medium" si Sepal Length esta entre 5 y 7
  # "big" si Sepal Length es mayor o igual a 7
iris$size <- ifelse(iris$Sepal.Length <=5, 
                    'small', ifelse(iris$Sepal.Length >= 7, 
                                    'big', 'medium'))
# Reto: Con un ciclo for del 1 al 50 e imprimir los numeros divisibles entre 3
for (i in 1:50) {
  if (i%%3 == 0) {
    print(i)
  }
}

# Reto: Con un ciclo for del 1 al 50 e imprimir los numeros divisibles entre 2 y 3
for (i in 1:50) {
  if (i%%2 == 0) {
    print(paste(i, 'es divisible entre 2'))
  } else if (i%%3 == 0){
    print(paste(i, 'es divisible entre 3'))
  }
}

# reto WHILE
i = 0
while (i != 10) {
  print(i)
  i = i +1
}
