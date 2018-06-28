library(shiny)
library(ggplot2)
library(MASS)
data(Animals)
Animals <- Animals

shinyUI(fluidPage(
  titlePanel("Compare Your Brain/Body Ratio to Other Species"),
  sidebarLayout(
    sidebarPanel(
      h5("This application compares your brain/body ratio (not scientifically proven) to other species."), 
      h5("You have to enter your head diameter (in cm) and weight (kg) and the application will calculate your brain/body ratio. The results will be shown in a plot and in numbers."),
      h5("THE BIGGER THE BETTER"), 
      selectInput("specie", "Select a specie for comparison", choices = row.names(Animals), selected = "Human"),
    numericInput("body", "Body weight (kg)", value=80),
    numericInput("head","Head diameter (cm)", value = 55)
  ),
  mainPanel(
    plotOutput("plot1"),
    h4("Brains/Body Ratio (User):", style = "color:red"),
    textOutput("text_user"),
    h4("Brains/Body Ratio (Specie):", style = "color:blue"),
    textOutput("text")
))))