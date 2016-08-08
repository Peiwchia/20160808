
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      
      numericInput("num", 
                   label = h3("numric input"),
                   value= 4),
      
      textInput("keyin", label = h3("Text input"),
                value = "keyinsth")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      plotOutput("kkkplot"),
      textOutput("hihihihi")
    )
  )
))
