library(datasets)
library(shiny)

ui <- fluidPage(
  titlePanel("Winning Percentages of the 2017 Division Champions"),
  
  sidebarLayout(      
    sidebarPanel(
      selectInput("team", "Team:", 
                  choices=colnames(yearly_records)),
      hr(),
      helpText("Winning Percentage of 2017 Division Champions ")),

    mainPanel(
      plotOutput("teamPlot"))))


server <- function(input, output) {

  output$teamPlot <- renderPlot({
    barplot(yearly_records[,input$team], 
            main=input$team,
            ylab="Winning Percentage",
            xlab="Year")})}
 
shinyApp(ui = ui, server = server)

