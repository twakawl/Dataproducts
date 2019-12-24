# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.

library(shiny)

#Select all variables except the Species variable
vars <- setdiff(names(iris), "Species")


# Start UI
shinyUI(fluidPage(
    # Application title
    titlePanel("Clustering of Iris flowers, using data for K-means clustering about Petal and Sepal Width and Length"),
    p("You can select the X and the Y variable for the plot. Afterwards you can define the number of clusters you want to cluster on."),
    p("Please be reminded that your selection of variables only affects your view, not the clustering itself."),
    # Sidebar with a slider input for number of bins
    sidebarPanel(
        selectInput('xcol', 'X Variable', choices = vars, selected = vars[[1]]),
        selectInput('ycol', 'Y Variable', vars, selected = vars[[2]]),
        sliderInput("clusters", "Cluster count:",
                    min = 1, max = 9, value = 3
        )
    ),
    mainPanel(
                plotOutput('plot1')
            )
))
