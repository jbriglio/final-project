library(readxl)

winning_defense <- read_excel("winning defense.xlsx")
winning_defense <- subset(winning_defense, select= -c(Player, Team))
row.names(winning_defense) <- (c("KC","NO","NE","PHI","LA","MIN","PIT","JAX"))
winning_defense <- as.matrix.data.frame(winning_defense)

losing_defense <- read_excel("losing defense.xlsx")
losing_defense <- subset(losing_defense, select= -c(Player, Team))
row.names(losing_defense) <- (c("NYJ", "SF","CLE","DEN","NYG","CHI","TB","HOU"))
losing_defense <- as.matrix.data.frame(losing_defense)

t.test(winning_defense[,1], losing_defense[,1], paired = TRUE) 
t.test(winning_defense[,2], losing_defense[,2], paired = TRUE)
t.test(winning_defense[,3], losing_defense[,3], paired = TRUE)
t.test(winning_defense[,4], losing_defense[,4], paired = TRUE)
t.test(winning_defense[,5], losing_defense[,5], paired = TRUE)
t.test(winning_defense[,6], losing_defense[,6], paired = TRUE)
t.test(winning_defense[,7], losing_defense[,7], paired = TRUE)