library(shiny)

ui <- fluidPage(
  titlePanel("Simple Calculator"),
  sidebarLayout(
    mainPanel(
      h5("Put the first and the second number, then
        select the operator (Calculator only accept whole number)"),
      numericInput("num1", "Key in the first whole number", 0),
      numericInput("num2", "Key in the second whole number", 0),
      selectInput("operator", "Select the operator",
                  choices = c("+","-","x", "÷"))
    ),
    mainPanel(
      h2("Result = "),
      textOutput("output")
    )))

server <- function(input,output) {
  
  
  output$output <- renderText({
    switch(input$operator,
           "+" = input$num1 + input$num2,
           "-" = input$num1 - input$num2,
           "x" = input$num1 * input$num2,
           "÷" = input$num1 / input$num2)
    
  })}

shinyApp(ui = ui, server = server)
