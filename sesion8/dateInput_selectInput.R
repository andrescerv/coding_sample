# reto 1: agregar un dateInput que empiece por default en 17/04/2020
# reto 2: agregar un selectInput con 4 opciones distintas
library(shiny)

ui <- fluidPage(
  titlePanel('titulo'),
  sidebarLayout(
    sidebarPanel('panel lateral'),
    mainPanel('panel principal',
              sliderInput("slider1", label = h3("Slider"), min = 0, 
                          max = 100, value = 50),
              dateInput("date", label = h3('date input'), value = "2020-04-17"),
              selectInput("select", label = h3('Checklist'),
                          choices = list("selecciona..." = 1, "A" = 2, "B" = 3, "C" = 4), 
                          selected = 1))
  )
)
server <-  function(input,output){}
shinyApp(ui, server)