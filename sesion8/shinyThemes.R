#install.packages("shinythemes")
#library(shiny)
#library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("united"),
  titlePanel('titulo', align = 'center'),
  sidebarLayout(
    sidebarPanel('sidebarpanel'),
    mainPanel(h2('mainpanel'))
  )
)

server <-  function(input,output){}
shinyApp(ui, server)