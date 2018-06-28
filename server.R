library(shiny)
library(ggplot2)
library(MASS)
data(Animals)
Animals <- Animals

shinyServer(
 function(input, output) {
   x <- reactive(Animals[input$specie,])
   head_weight <- reactive((4*pi*(input$head/pi/2)^3) /3 * 1.045/2)
   output$text <- renderText(x()$brain/x()$body)
   output$text_user <- renderText(head_weight()/input$body)
   output$plot1 <- renderPlot({
    ggplot(x(), aes(body,brain)) + geom_point(colour="blue", size = 5, shape = "S") + geom_point(aes(x=input$body,y=head_weight()), colour="red", size=5, shape = "U") + xlim(0,NA) +ylim(0, NA) + ylab("Brain weight (g)") + xlab("Body weight (kg)")
    
  })
  
})
