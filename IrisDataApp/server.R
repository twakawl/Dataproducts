# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    # Select all the data for the clustering
    clust_data <- iris[,setdiff(names(iris), "Species")]

    # Combine the selected variables into a new data frame for the plot
    selectedData <- reactive({
        iris[,c(input$xcol,input$ycol)]
    })

    clusters <- reactive({
        kmeans(clust_data, input$clusters)
    })
    colorsPlot = c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3","#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999")

    output$plot1 <- renderPlot({
        palette(colorsPlot)
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 20, cex = 2)
        points(clusters()$center[,c(input$xcol,input$ycol)], pch = 4, cex = 3, lwd = 2)
    })
})



