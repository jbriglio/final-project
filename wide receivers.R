library(readxl)

losing_wr <- read_excel("losing wr.xlsx")
losing_wr <- subset(losing_wr, select= -c(Player, Team))
row.names(losing_wr) <- (c("NYJ", "SF","CLE","DEN","NYG","CHI","TB","HOU"))
losing_wr <- as.matrix.data.frame(losing_wr)

winning_wr <- read_excel("winning wr.xlsx")
winning_wr <- subset(winning_wr, select= -c(Player, Team))
row.names(winning_wr) <- (c("KC","NO","NE","PHI","LA","MIN","PIT","JAX"))
winning_wr <- as.matrix.data.frame(winning_wr)

t.test(winning_wr[,1], losing_wr[,1], paired = TRUE) 
t.test(winning_wr[,2], losing_wr[,2], paired = TRUE)
t.test(winning_wr[,3], losing_wr[,3], paired = TRUE)
t.test(winning_wr[,4], losing_wr[,4], paired = TRUE)
t.test(winning_wr[,5], losing_wr[,5], paired = TRUE)
t.test(winning_wr[,6], losing_wr[,6], paired = TRUE)
t.test(winning_wr[,7], losing_wr[,7], paired = TRUE)