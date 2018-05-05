library(readxl)
library(tidyverse)
library(dplyr)
mock_draft_picks <- read_excel("mock draft picks.xlsx")
mock_draft_teams <- read_excel("mock draft picks.xlsx")
mock_draft_picks <- subset(mock_draft_picks, select = -c(Team))
row.names(mock_draft_picks) <- c("CLE", "NYG", "NYJ", "CLE2", "DEN", "IND", "TB", "CHI", 
                                 "SF", "LA", "MIA", "BUF", "WAS", "GB", "ARZ", "BAL", 
                                 "LAC", "SEA", "DAL", "DET", "CIN", "BUF2", "NE", "CAR", 
                                 "TEN", "ATL", "NO", "PIT", "JAX", "MIN", "NE2", "PHI")
mock.1 <- mock_draft_picks %>% count(Category)
mock.2 <- subset(mock.1, select = c("n"))
row.names(mock.2) <- c("defense", "passing", "receiving", "rushing", "unsure")
colnames(mock.2) <- c("frequency")
mock.3 <- as.matrix.data.frame(mock.2)
barplot(mock.3[,1], 
        names.arg=rownames(mock.3), 
        main="Frequency of Category Picks", 
        col = "darkblue", 
        las = 2)

mock.4 <- mock_draft_picks %>% count(`Best Guess`)
mock.5 <- subset(mock.4, select = c("n"))
row.names(mock.5) <- c("CB", "DE", "DT", "G", "ILB", "OLB", "OT", "QB", 
                       "RB", "S", "TE", "UNSURE", "WR")
colnames(mock.5) <- c("frequency")
mock.6 <- as.matrix.data.frame(mock.5)
barplot(mock.6[,1], 
        names.arg=rownames(mock.6), 
        main="Frequency of Position Picks", 
        col = "darkblue", 
        las = 2)

percentages_teams <- read_excel("percentages teams.xlsx")
mock.7 <- full_join(percentages_teams, mock_draft_teams, by = "Team")
mock.7 <- mock.7 %>% na.exclude()
mock.8 <- mock.7 %>% select(`Team`, `Percentage`, `Category`)
mock.9 <- mock.8[1:14, 1:3]

winning_picks <- mock.9[1:7, 1:3]
winning_picks2 <- winning_picks %>% count(`Category`)
colnames(winning_picks2) <- c("Category", "Frequency")
winning_picks2

losing_picks <- mock.9[8:14, 1:3]
losing_picks2 <- losing_picks %>% count(`Category`)
colnames(losing_picks2) <- c("Category", "Frequency")
losing_picks2

defence_percentages <- mock.9 %>% filter(`Category`=="defense")
defence_percentages_average <- mean(defence_percentages$Percentage)
defence_percentages_average

passing_percentages <- mock.9 %>% filter(`Category`=="passing")
passing_percentages_average <- mean(passing_percentages$Percentage)
passing_percentages_average

rushing_percentages <- mock.9 %>% filter(`Category`=="rushing")
rushing_percentages_average <- mean(rushing_percentages$Percentage)
rushing_percentages_average

receiving_percentages <- mock.9 %>% filter(`Category`=="receiving")
receiving_percentages_average <- mean(receiving_percentages$Percentage)
receiving_percentages_average

actual_picks <- read_excel("actual picks.xlsx")
mock_actual <- full_join(mock_draft_teams, actual_picks, by="Team")
rownames(mock_actual) <- c("CLE",  "NYG",  "NYJ",  "CLE2", "DEN",  "IND",     
                           "TB", "CHI",  "SF",   "LA",   "MIA",  "BUF", 
                           "WAS",  "GB",   "ARZ",  "BAL",  "LAC",  "SEA",  
                           "DAL",  "DET",  "CIN",  "BUF2", "NE",   "CAR", 
                           "TEN",  "ATL",  "NO",   "PIT",  "JAX",  "MIN",  
                           "NE2",  "PHI",  "BAL2")
mock_actual <- subset(mock_actual, select = c("Team", "Best Guess", "Category", 
                                              "Actual Pick", "Actual Category"))
mock_actual.2 <- mock_actual %>% count(`Best Guess`)  
colnames(mock_actual.2) <- c("pick", "guess freq")
mock_actual.3 <- mock_actual %>% count(`Actual Pick`)
colnames(mock_actual.3) <- c("pick", "actual freq")
mock_actual.4 <- mock_actual %>% count(`Category`)
mock_actual.5 <- mock_actual %>% count(`Actual Category`)
mock_actual_picks <- full_join(mock_actual.2, mock_actual.3,  by="pick") 
mock_actual_picks <- mock_actual_picks[-c(12, 14), -c(1)]
mock_actual_picks[is.na(mock_actual_picks)] <- 0 
rownames(mock_actual_picks) <- c("CB", "DE", "DT", "G", "ILB", "OLB", 
                                 "OT",  "QB",  "RB",  "S",   "TE",  
                                 "WR",  "C",   "LB", "T")
mock_actual_picks <- read_excel("mock_actual_picks2.xlsx")
mock_actual_picks <- as.matrix.data.frame(mock_actual_picks)
rownames(mock_actual_picks) <- c("guess freq", "actual freq")
barplot(height = mock_actual_picks[1:2, 1:15], 
        main="Comparison of Postion Picks 
Between Mock & Real Draft", 
        col = c("darkblue", "red"), 
        las = 2, 
        beside = TRUE, 
        cex.names=.7)

mock_actual.4 <- mock_actual %>% count(`Category`)
mock_actual.5 <- mock_actual %>% count(`Actual Category`)
colnames(mock_actual.4) <- c("category", "mock pick freq")
colnames(mock_actual.5) <- c("category", "actual pick freq")
mock_actual_picks3 <- full_join(mock_actual.4, mock_actual.5,  by="category") 
mock_actual_picks3 <- mock_actual_picks3[-c(5:6),]
mock_actual_picks3 <- read_excel("mock_actual_picks3.xlsx")
mock_actual_picks3 <- as.matrix.data.frame(mock_actual_picks3)
rownames(mock_actual_picks3) <- c("guess freq", "actual freq")
barplot(height = mock_actual_picks[1:2, 1:15], 
        main="Comparison of Postion Picks 
        Between Mock & Real Draft", 
        col = c("darkblue", "red"), 
        las = 2, 
        beside = TRUE, 
        cex.names=.7)
