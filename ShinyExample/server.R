library(shiny)

#The server is where everything is processed, this is where the R code goes!
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({ #Creating an object that is the output labeled distPlot
        
        data %>%
            ggplot(aes(x=get(input$characteristic))) + 
            geom_histogram() +
            labs(x= input$characteristic)
    })
    output$table <- renderTable({
        data %>%
            filter(Body >= input$Body,
                   Nutty >= input$Nutty,
                   Medicinal <= input$Medicinal,
                   Price <= input$Price)
    })
})
