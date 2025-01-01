library(shiny)
library(tidyverse)

server <- function(input, output) {
  
  # Reactive prediction
  predicted_mpg <- reactive({
    # Convert input$cyl to numeric to match model's data type
    model <- lm(mpg ~ hp + cyl, data = mtcars)
    predict(model, newdata = data.frame(hp = input$hp, cyl = as.numeric(input$cyl)))
  })
  
  # Display predicted MPG
  output$mpgPrediction <- renderText({
    paste("Predicted MPG:", round(predicted_mpg(), 2))
  })
  
  # Reactive dataset filtering for plotting
  filtered_data <- reactive({
    mtcars %>%
      filter(cyl == as.numeric(input$cyl))
  })
  
  # Generate scatter plot
  output$scatterPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = hp, y = mpg)) +
      geom_point() +
      labs(title = paste("MPG vs Horsepower for", input$cyl, "Cylinders"),
           x = "Horsepower",
           y = "Miles Per Gallon") +
      theme_minimal()
  })
}
