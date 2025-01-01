library(shiny)


ui <- fluidPage(
  titlePanel("Miles Per Gallon (MPG) Predictor"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("hp", "Horsepower:", min = 50, max = 350, value = 150),
      selectInput("cyl", "Number of Cylinders:", choices = c(4, 6, 8), selected = 4)
    ),
    mainPanel(
      textOutput("mpgPrediction"),
      plotOutput("scatterPlot")
    )
  )
)
