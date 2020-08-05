library(shiny)
library(shinythemes)

# Agregar un textOutput en el sidebarPanel que tenga outputId = 'text_salida'
# En el server, van a tomar el numero resultante del sliderInput,
# van a revisar si el numero es igual a 15
# Si es igual a 15, imprimir 'Correcto', en otro caso imprimir 'Sigue intentando'

ui <- fluidPage(
  theme = shinytheme("flatly"),
  titlePanel(h1('Some Widgets', align = 'center')),
  sidebarLayout(position = "right",
                sidebarPanel(
                  sliderInput(inputId = "slider1", 
                              label = h6("Selecciona numero", align = 'center'),
                              min = 10, 
                              max = 20, 
                              value = 12),
                  textOutput(outputId = 'text_salida')
                ),
                mainPanel(dateInput(inputId = "date",  
                                    label = h3("Selecciona una fecha"),  
                                    value = "2020-04-17"),
                          selectInput(inputId = "select", 
                                      label = h3("Select box"), 
                                      choices = list("Choice 1" = 1, 
                                                     "Choice 2" = 2,
                                                     "Choice 3" = 3,
                                                     "Choice 4" = 4), 
                                      selected = 1),
                          textInput(inputId = 'texto',
                                    label = '¿Cuál es tu nombre?',
                                    value = 'Ana') ,
                          submitButton(text = 'Finalizar') )
  )
)
server <- function(input, output) {
  output$text_salida <- renderText(
    ifelse(input$slider1 == 15,
           'correcto',
           'incorrecto')
  )
}
shinyApp(ui = ui, server = server)