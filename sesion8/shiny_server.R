library(shiny)
ui<- fluidPage(
  titlePanel("Server"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = 'textoentrada',
                label = 'Esto es un text input'),
                value = 'Escribe algo...'),
    mainPanel(
      textOutput(outputId = 'textosalida')
    )
    )
  )
)
server <- function(input, output){
  output$textosalida <- renderText({paste('Tu nombre es: ', input$textoentrada)})
}
shinyApp(ui = ui, server = server)