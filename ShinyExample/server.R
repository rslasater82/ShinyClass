library(shiny)
whisky <- read_csv("Whisky.csv")

#The server is where everything is processed, this is where the R code goes!
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({ #Creating an object that is the output labeled distPlot
       whisky %>%
            ggplot(aes_string(x=input$characteristic)) + 
            geom_histogram() +
            labs(x= input$characteristic)
    })
    output$table <- renderTable({
        whisky %>%
            filter(Body >= input$Body,
                   Nutty >= input$Nutty,
                   Medicinal <= input$Medicinal,
                   Price <= input$Price)
    })
})
