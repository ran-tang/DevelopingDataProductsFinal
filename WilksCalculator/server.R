#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR)
library(dplyr)
library(plotly)
library(ggplot2)


#Input setup

#Constants for Wilks Calcuation
am <- -216.0475144
bm <- 16.2606339
cm <- -0.002388645
dm <- -0.00113732
em <- 7.01863 * 10^-6
fm <- -1.291 * 10^-8

af <- 594.31747775582
bf <- -27.23842536447
cf <- 0.82112226871
df <- -0.00930733913
ef <- 4.731582 * 10^-05
ff <- -9.054 * 10^-08

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    
    #Wilks Calculation
    output$text1 <- renderText({
        paste("Your estimated total is: ",
              (input$bench + input$squat + input$deadlift), "lbs")
    })
    output$WilksPlot <- renderPlot({
        total <- input$bench + input$squat + input$deadlift
        totalkg <- total/2.2
        if (input$gender == "Male") {
            func1 <- function(x) totalkg*500/(am + bm*(x/2.2) + cm*(x/2.2)^2 + dm*(x/2.2)^3 + em*(x/2.2)^4 + fm*(x/2.2)^5)
        } else {
            func1 <- function(x) totalkg*500/(af + bf*(x/2.2) + cf*(x/2.2)^2 + df*(x/2.2)^3 + ef*(x/2.2)^4 + ff*(x/2.2)^5)
        }
        # generate bins based on input$bins from ui.R
        WilksPlot <- ggplot(data = data.frame(x = 0), mapping=aes(x = x)) +
            xlab("Your Weight in lbs") +
            ylab("Your Estimated Wilks Score") +
            ggtitle("Wilks Calculator") +
            theme(plot.title = element_text(hjust = 0.5))+
            theme(plot.title = element_text(size=25))+
            stat_function(fun = func1) + 
            xlim(100,350)
        WilksPlot
    })
    
})
