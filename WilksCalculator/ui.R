#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Wilks Score Calculator"),
    
    # Sidebar with a slider input Lifts and Gender
    sidebarLayout(
        sidebarPanel(
            width = 4,
            h3("Inputs"),
            h5("Please enter the following information", align = "center"),
            selectInput("gender", "Gender:", c("Male", "Female")),
            sliderInput("bench",
                        "Bench Press 1-rep Max in lbs:",
                        min = 0,
                        max = 800,
                        value = 200,
                        step = 5),
            sliderInput("squat",
                        "Back Squat 1-rep Max in lbs:",
                        min = 0,
                        max = 1000,
                        value = 300,
                        step = 5),
            sliderInput("deadlift",
                        "Deadlift 1-rep Max in lbs:",
                        min = 0,
                        max = 1300,
                        value = 400,
                        step = 5),
        ),
        # Show a plot of the generated distribution
        mainPanel(
            htmlOutput("text1"),
            plotOutput("WilksPlot")
        )
    )    
))
