library(shiny)
library(datasets)
library(readr)
library(dplyr)
library(markdown)
library(tidyverse)

yearly_records <- read_csv("yearly_records_csv.csv") %>% as.matrix.data.frame()
rownames(yearly_records) <- yearly_records[,1]
yearly_records <- subset(yearly_records, select= -c(Year))

winning_quarterbacks <- read_csv("winning quarterbacks csv.csv")
winning_quarterbacks <-subset(winning_quarterbacks, select= -c(Player, Team))
row.names(winning_quarterbacks) <- (c("KC","NO","NE","PHI","LA","MIN","PIT","JAX"))
winning_quarterbacks <- as.matrix.data.frame(winning_quarterbacks)

winning_rb <- read_csv("winning rb csv.csv")
winning_rb <- subset(winning_rb, select= -c(Player, Team))
row.names(winning_rb) <- (c("KC","NO","NE","PHI","LA","MIN","PIT","JAX"))
winning_rb <- as.matrix.data.frame(winning_rb)

winning_wr <- read_csv("winning wr csv.csv")
winning_wr <- subset(winning_wr, select= -c(Player, Team))
row.names(winning_wr) <- (c("KC","NO","NE","PHI","LA","MIN","PIT","JAX"))
winning_wr <- as.matrix.data.frame(winning_wr)

winning_defense <- read_csv("winning defense csv.csv")
winning_defense <- subset(winning_defense, select= -c(Player, Team))
row.names(winning_defense) <- (c("KC","NO","NE","PHI","LA","MIN","PIT","JAX"))
winning_defense <- as.matrix.data.frame(winning_defense)

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