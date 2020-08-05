library(shiny)

ui <- fluidPage(
  titlePanel('titulo'),
  sidebarLayout(
    sidebarPanel('panel lateral'),
    mainPanel('panel principal')
  )
)
server <-  function(input,output){}
shinyApp(ui, server)

ui <- fluidPage(
  titlePanel(h1('Mi primer Shiny web app', align = 'center')),
  sidebarLayout(
    sidebarPanel(h6('código utilizado'), 
                 code(print('hola mundo'),
                 align = 'center'),
                 strong('shala')),
    mainPanel(sliderInput("slider1", label = h3('Slider',
                                                                 min = 0, 
                                                                 max = 100,
                                                                 value = 50)),
      h2('QBs en la historia'),
              p('Este proyecto analiza los número de los QBs en la historia de la NFL.'),
              br(),
              p('Los datos analizados son los números de los QBs que jugaron entre 19xx y 20xx'),
              actionButton("action", "Action"))
  )
)
server <-  function(input,output){}
shinyApp(ui, server)