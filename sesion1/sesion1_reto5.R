# SESIÓN 1, RETO 5
# Crea una función que reciba de argumento un nombre y 
# devuelve 'Bienvenido -nombre', ponle a la función el nombre de welcome
welcome <- function(name){
  msg <- paste('Bienvenido ', name)
  return(msg)
}

#Pruebala con tu nombre
welcome('Andrés')

#Pide ayuda con la función readline, es decir corre ?readline
?readline

#Explica que hace el siguiente código:
  nombre <- readline(prompt = '¿Cuál es tu nombre?')
  welcome(nombre)
  # La función primero te pregunta "¿cuál es tu nombre?".
  # La respuesta que se le de será guardada en la variable 'nombre'.
  # La variable 'nombre' es el argumento de la función 'welcome'.

#Modifica tu función welcome para que, además de nombre, pida edad. 
  #Ahora, debera regresar 'Bienvenido -nombre- con -edad- años'. 
  #Esta nueva función se debe llamar welcome.2
  welcome.2 <- function(){
    name <- readline(prompt = '¿Cuál es tu nombre?')
    age <- readline(prompt = '¿Cuántos años tienes?')
    msg <- paste('Bienvenido', name, 'con edad de', age, 'años.')
    return(msg)
  }
