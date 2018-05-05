library(readxl)
winning_percentages <- read_excel("winning percentages.xlsx")
winning_percentages <- as.matrix.data.frame(winning_percentages)
barplot(winning_percentages, 
        names.arg=rownames(winning_percentages), 
        main="2017 Season Winning Percentage", 
        col = "darkblue", 
        las = 2)

divisional_winners <- read_excel("divisional winners.xlsx")
divisional_winners <- as.matrix.data.frame(divisional_winners)
barplot(divisional_winners, 
        names.arg=rownames(divisional_winners), 
        main="2017 Season Divisional Winners", 
        col = "darkblue", 
        las = 2)
divisional_losers <- read_excel("divisional losers.xlsx")
divisional_losers <- as.matrix.data.frame(divisional_losers)
barplot(divisional_losers, 
        names.arg=rownames(divisional_losers), 
        main="2017 Season Divisional Losers", 
        col = "darkblue", 
        las = 2)

yearly_records <- read_excel("yearly_records.xlsx")
yearly_records <- as.matrix.data.frame(yearly_records)
rownames(yearly_records) <- yearly_records[,1]
yearly_records <- subset(yearly_records, select= -c(Year))

divisional_winners_losers <- read_excel("divisional winners and losers.xlsx")
divisional_winners_losers <- as.matrix.data.frame(divisional_winners_losers)
rownames(divisional_winners_losers) <- c("winning record", "losing record")
barplot(height = divisional_winners_losers[1:2, 1:8], 
        main="2017 Divisional Winners & Losers", 
        col = c("darkblue", "red"), 
        las = 2, 
        beside = TRUE)

average_winning <- (divisional_winners_losers[1,])
average_losing <- (divisional_winners_losers[2,])
t.test(average_winning, average_losing, paired = TRUE)                        
