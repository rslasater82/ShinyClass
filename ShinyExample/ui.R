library(shiny)
library(tidyverse)

whisky <- read_csv("Whisky.csv")
controls <- colnames(select_if(whisky, is.numeric)) #Reduce to just numeric columns, done before we go into the UI

# Define UI for application, UI is is the controls that the user has to interact with the data
shinyUI(fluidPage(

    # Application title
    titlePanel("I love scotch. Scotchy, scotch, scotch. Here it goes down..."),
    
    #Application will display summary data for characteristics
    # 
    sidebarLayout( #This starts the function for the sidebar
        sidebarPanel( #This determines what is in the panel, what will follow will
            #be the individual controls. First will select the variable to plot
            selectInput( #Control type to select input
                inputId = "characteristic", #This will be in id for the input, think of it as a variable name
                label = "Whisky Characteristic", #This is what will be displayed
                choices = controls,
                selected = "Body"
            ),
            sliderInput( #We will make four of these, do we want them to effect the whole dataset?
                inputId = "Body",
                label = "Minimum Body Rating",
                min = min(whisky$Body),
                max = max(whisky$Body),
                value = 0
            ),
            sliderInput( #We will make four of these, do we want them to effect the whole dataset?
                inputId = "Nutty",
                label = "Minimum Nutty Rating",
                min = min(whisky$Body),
                max = max(whisky$Body),
                value = 0
            ),
            sliderInput( #We will make four of these, do we want them to effect the whole dataset?
                inputId = "Medicinal",
                label = "Maximum Medicinal Rating",
                min = min(whisky$Medicinal),
                max = max(whisky$Medicinal),
                value = 0
            ),
            sliderInput( #We will make four of these, do we want them to effect the whole dataset?
                inputId = "Price",
                label = "Maximum Price Rating",
                min = min(whisky$Price, na.rm = T),
                max = max(whisky$Price, na.rm = T),
                value = max(whisky$Price, na.rm = T)
            )
        ),

        # Show a plot of the generated distribution
        mainPanel( #This determines what will be the main display
            plotOutput("distPlot"), #This will output our plot
            tableOutput("table") #This will display our filtered table
            
        )
    )
))
