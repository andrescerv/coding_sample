# ESTRUCTURA DE SHINY WEB APPS
install.packages("shiny")

# Cada Shiny App deberá contenida en un script llamada app.R, 
# el cual consta de los siguientes cuatro elementos:
  # 1. un llamado a la librería shiny
  library(shiny)
  # 2. una interfaz de usuario (ui)
  ui <- ...
  #3. una función (server) 
  server <-  function(input,output){...}
  # 4. un llamado a la función shinyApp 
  shinyApp(ui = ui, server = server)

# EJEMPLOS:
runExample("01_hello")
runExample("02_text")     
runExample("03_reactivity")
runExample("04_mpg")
runExample("05_sliders")
runExample("06_tabsets")
runExample("07_widgets")    
runExample("08_html")
runExample("09_upload")
runExample("10_download")
runExample("11_timer")
