library(shiny)
library(ggplot2)
#define the user interface (ui)

ui <- fluidPage(title = "I am a nice page",
                "Hello World",
                sliderInput(inputId = "num", 
                            label = "Select your number:", 
                            min = 0,
                            max = 100, 
                            value = 75
                            ),
                plotOutput(outputId = "hist"))

#define the server

server <- function(input, output){
  
  data <- reactive({
    data.frame(x = rnorm(input$num))
    })
 
  output$hist <- renderPlot(
    #data = data.frame(x = rnorm(input$num))
    {
    #data = data.frame(x = rnorm(input$num)) #define the dataset
    ggplot(data(), aes(x)) +
      geom_histogram() #plot the histogram
  })
  }
  
# run the shiny app

shinyApp(ui = ui, server = server)
