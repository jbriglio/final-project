library(readxl)
winning_quarterbacks <- read_excel("winning quarterbacks.xlsx")
winning_quarterbacks <- subset(winning_quarterbacks, select= -c(Player, Team))
row.names(winning_quarterbacks) <- (c("KC","NO","NE","PHI","LA","MIN","PIT","JAX"))
winning_quarterbacks <- as.matrix.data.frame(winning_quarterbacks)

losing_quarterbacks <- read_excel("losing quarterbacks.xlsx")
losing_quarterbacks <- subset(losing_quarterbacks, select= -c(Player, Team))
row.names(losing_quarterbacks) <- (c("NYJ", "SF","CLE","DEN","NYG","CHI","TB","HOU"))
losing_quarterbacks <- as.matrix.data.frame(losing_quarterbacks)

t.test(winning_quarterbacks[,1], losing_quarterbacks[,1], paired = TRUE) 
t.test(winning_quarterbacks[,2], losing_quarterbacks[,2], paired = TRUE)
t.test(winning_quarterbacks[,3], losing_quarterbacks[,3], paired = TRUE)
t.test(winning_quarterbacks[,4], losing_quarterbacks[,4], paired = TRUE)
t.test(winning_quarterbacks[,5], losing_quarterbacks[,5], paired = TRUE)
t.test(winning_quarterbacks[,6], losing_quarterbacks[,6], paired = TRUE)
t.test(winning_quarterbacks[,7], losing_quarterbacks[,7], paired = TRUE)


