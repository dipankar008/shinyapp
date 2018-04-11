library(shiny)
library(ggplot2)
library(dplyr)
View(diamonds)
ui <- fluidPage(
  title = "Diamonds Data",
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      selectInput(
        inputId = "select",
        label = "Select the parameter", 
        choices = colnames(diamonds), selected = diamonds$cut
        
      ),
      
      textInput(
        inputId = "text", 
        label = "", 
        value = ""
      
      )
    ),
    mainPanel(
      plotOutput(
        outputId = "barplot"
      )
    )
  )
)

server <- function(input, output) {
    
  data <- reactive(
    diamonds %>%
      select(input$select )
  )
    
    output$barplot <- renderPlot({
    #y = input$text
    ggplot(data(), aes(x=input$select)) +
    geom_bar() + ggtitle(input$text)
  })
}

shinyApp(ui, server)