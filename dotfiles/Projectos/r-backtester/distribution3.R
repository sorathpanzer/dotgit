t1 <- Sys.time()
suppressPackageStartupMessages(library(doParallel))
registerDoParallel(detectCores())

add.distribution(strategy.st,
                 paramset.label = "EMA",
                 component.type = "indicator",
                 component.label = "nFast",
                 variable = list(n = 0:1),
                 label = "nFAST")

add.distribution(strategy.st, 
                 paramset.label = "EMA",
                 component.type = "indicator", 
                 component.label = "nMed",
                 variable = list(n = 50:53), 
                 label = "nMED")

add.distribution(strategy.st, 
                 paramset.label = "EMA",
                 component.type = "indicator", 
                 component.label = "nSlow",
                 variable = list(n = 100:103), 
                 label = "nSLOW")

add.distribution.constraint(strategy.st,
                            paramset.label = "EMA",
                            distribution.label.1 = "nFAST",
                            distribution.label.2 = "nMED",
                            operator = "<",
                            label = "EMA.Constraint")

add.distribution.constraint(strategy.st,
                            paramset.label = "EMA2",
                            distribution.label.1 = "nMED",
                            distribution.label.2 = "nSLOW",
                            operator = "<",
                            label = "EMA.Constraint2")

results <- apply.paramset(strategy.st,
                          paramset.label = "EMA",
                          portfolio.st = portfolio.st,
                          account.st = account.st)

out <- profit_dat <- results$tradeStats %>%
  select(nFAST, nMED, nSLOW, Portfolio, End.Equity) %>%
  group_by(Portfolio) %>%
  summarize(Fast = mean(nFAST),
            Med = mean(nMED),
            Slow = mean(nSLOW),
            Profit = sum(End.Equity)) %>%
  select(Med, Slow, Fast, Profit) %>%
  arrange(desc(Profit))

stats <- results$tradeStats[,c("nFAST","nMED","nSLOW","Percent.Positive","Profit.Factor","Ann.Sharpe","Max.Drawdown","Max.Equity","Min.Equity","End.Equity")]
head(stats[order(-stats$End.Equity),])
out

plot(Profit ~ Fast, data = profit_dat, main = "Profit vs. Fast MA Window")
plot(Profit ~ Med, data = profit_dat, main = "Profit vs. Med MA Window")
plot(Profit ~ Slow, data = profit_dat, main = "Profit vs. Slow MA Window")

t2 <- Sys.time()
print(t2-t1)