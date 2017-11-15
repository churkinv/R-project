
# load shiny
install.packages("shiny")
library(shiny)

#create a ui
ui <- fluidPage("DataScience with R")

#create a server
server <- function(input, output) { }

#create a shiny app
shinyApp(
         ui = ui,
         server = server)

#create a ui with i/o controls
ui <- fluidPage(
                titlePanel("DataScience with R"),
                sidebarLayout(
                              sidebarPanel(
                                           sliderInput(
                                                       inputId = "num",
                                                       label = "Choose a Number",
                                                       min = 0,
                                                       max = 100,
                                                       value = 25)),
                                             mainPanel(
                                                       textOutput(
                                                       outputId = "text"))))

#create a server than maps imput to output
server <- function(input, output) {
    output$text <- renderText({
        paste("You selected", input$num)
    })
}

#create a shiny app
shinyApp(
         ui = ui,
         server = server)

#load tree model from our previous ml
load("Tree.RData")

#lpad color brewer library
library(RColorBrewer)

#create color palette
palette <- brewer.pal(3, "Set2")

#create ui code
ui <- fluidPage(
                titlePanel("Iris Species Predictor"),
                sidebarLayout(
                    sidebarPanel(
                        sliderInput(
                            inputId = "petal.length",
                            label = "Petal Length (cm)",
                            min = 1,
                            max = 7,
                            value = 4),
                         sliderInput(
                            inputId = "petal.width",
                            label = "Petal Width (cm)",
                            min = 0.0,
                            max = 2.5,
                            value = 1.5)),
                          mainPanel(
                            textOutput(
                                outputId = "text"),
                             plotOutput(
                                outputId = "plot"))))

#create server code
server <- function(input, output) {
    output$text = renderText({
        #create predictors
        predictors <- data.frame(
                             Petal.Length = input$petal.length,
                             Petal.Width = input$petal.width,
                             Sepal.Length = 0,
                             Sepal.Width = 0)
        #make predictions
        prediction = predict(
                         object = model,
                         newdata = predictors,
                         type = "class")
        #create prediction text
        paste(
          "The predicted species is ",
          as.character(prediction))
    })
    output$plot = renderPlot({
        #create a scatterplot colored by species
        plot(
             x = iris$Petal.Length,
             y = iris$Petal.Width,
             pch = 19,
             col = palette[as.numeric(iris$Species)],
             main = "Iris Petal Length vs Width",
             xlab = "Petal Length (cm)",
             ylab = "Petal Width (cm)")
        #plot the decision boundaries
        partition.tree(
               model,
               label = "Species",
               add = TRUE)
               #draw predictor on plot
               points(
                      x = input$petal.length,
                      y = input$petal.width,
                      col = "red",
                      pch = 4,
                      cex = 2,
                      lwd = 2)
    })
}

#create a shiny app
shinyApp(
         ui = ui,
         server = server)
