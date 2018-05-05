library(shiny)
library(tidyverse)
library(datasets)

ui <- navbarPage("NFL Analysis",  
                 
                 tabPanel("Winning Percentages",
                          sidebarLayout(      
                            sidebarPanel(
                              selectInput("team", "Team:", 
                                          choices=colnames(yearly_records)),
                              hr(),
                              helpText("Winning Percentage of 2017 Division Champions ")),
                            
                            mainPanel(
                              plotOutput("teamPlot")))),
                 
                 tabPanel("Quarterbacks",
                          sidebarLayout(      
                            sidebarPanel(
                              selectInput("statistic", "Statistic:", 
                                          choices=colnames(winning_quarterbacks)),
                              hr(),
                              helpText("Quarterback Statistics from NFL Database")),
                            
                            mainPanel(
                              plotOutput("qbPlot")))),
                 
                 tabPanel("Running Backs",
                          sidebarLayout(      
                            sidebarPanel(
                              selectInput("stat", "Statistic:", 
                                          choices=colnames(winning_rb)),
                              hr(),
                              helpText("Running Back Statistics from NFL Database")),
                            
                            mainPanel(
                              plotOutput("rbPlot")))),
                 tabPanel("Wide Receivers",
                          sidebarLayout(      
                            sidebarPanel(
                              selectInput("stats", "Statistic:", 
                                          choices=colnames(winning_wr)),
                              hr(),
                              helpText("Wide Receiver Statistics from NFL Database")),
                            
                            mainPanel(
                              plotOutput("wrPlot")))),
                 tabPanel("Defense",
                          sidebarLayout(      
                            sidebarPanel(
                              selectInput("statistics", "Statistic:", 
                                          choices=colnames(winning_defense)),
                              hr(),
                              helpText("Defensive Statistics from NFL Database")),
                            
                            mainPanel(
                              plotOutput("defPlot"))))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$teamPlot <- renderPlot({
    barplot(yearly_records[,input$team], 
            main=input$team,
            ylab="Winning Percentage",
            xlab="Year")})
  
  output$qbPlot <- renderPlot({
    barplot(winning_quarterbacks[,input$statistic], 
            main=input$statistic,
            ylab="Number/Rating",
            xlab="Team")})
  
  output$rbPlot <- renderPlot({
    barplot(winning_rb[,input$stat], 
            main=input$stat,
            ylab="Number/Rating",
            xlab="Team")})
  
  output$wrPlot <- renderPlot({
    barplot(winning_wr[,input$stats], 
            main=input$stats,
            ylab="Number/Rating",
            xlab="Team")})
  output$defPlot <- renderPlot({
    barplot(winning_defense[,input$statistics], 
            main=input$statistics,
            ylab="Number/Rating",
            xlab="Team")})
}

# Run the application 
shinyApp(ui = ui, server = server)