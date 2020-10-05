            t1 <- Sys.time()
            suppressPackageStartupMessages(library(doParallel))
            registerDoParallel(detectCores())
            
#            add.distribution(strategy.st,
#                             paramset.label = "EMA",
#                             component.type = "indicator",
#                             component.label = "nFast",
#                             variable = list(n = 0:8),
#                             label = "nFAST")
            
            add.distribution(strategy.st, 
                             paramset.label = "EMA",
                             component.type = "indicator", 
                             component.label = "nMed",
                             variable = list(n = 50:60), 
                             label = "nMED")
            
            add.distribution(strategy.st, 
                             paramset.label = "EMA",
                             component.type = "indicator", 
                             component.label = "nSlow",
                             variable = list(n = 100:110), 
                             label = "nSLOW")
            
            add.distribution.constraint(strategy.st,
                                        paramset.label = "EMA",
                                        distribution.label.1 = "nMED",
                                        distribution.label.2 = "nSLOW",
                                        operator = "<",
                                        label = "EMA.Constraint")
            
            results <- apply.paramset(strategy.st,
                                      paramset.label = "EMA",
                                      portfolio.st = portfolio.st,
                                      account.st = account.st)
            
            out <- profit_dat <- results$tradeStats %>%
                select(nMED, nSLOW, Portfolio, End.Equity) %>%
                group_by(Portfolio) %>%
                summarize(Med = mean(nMED),
                          Slow = mean(nSLOW),
                          Profit = sum(End.Equity)) %>%
                select(Med, Slow, Profit) %>%
                arrange(desc(Profit))
            
            stats <- results$tradeStats[,c("nMED","nSLOW","Percent.Positive","Profit.Factor","Ann.Sharpe","Max.Drawdown","Max.Equity","Min.Equity","End.Equity")]
            head(stats[order(-stats$End.Equity),])
            out
            
            plot(Profit ~ Med, data = profit_dat, main = "Profit vs. Med MA Window")
            plot(Profit ~ Slow, data = profit_dat, main = "Profit vs. Slow MA Window")
    
            t2 <- Sys.time()
            print(t2-t1)