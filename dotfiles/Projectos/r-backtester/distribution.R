            t1 <- Sys.time()
            suppressPackageStartupMessages(library(doParallel))
            registerDoParallel(cores=detectCores())
            
            add.distribution(strategy.st,
                             paramset.label = "EMA",
                             component.type = "indicator",
                             component.label = "nFast",
                             variable = list(n = 0:8),
                             label = "nFAST")
            
            add.distribution(strategy.st, 
                             paramset.label = "EMA",
                             component.type = "indicator", 
                             component.label = "nMed",
                             variable = list(n = 0:30), 
                             label = "nMED")
            
            add.distribution(strategy.st, 
                             paramset.label = "EMA",
                             component.type = "indicator", 
                             component.label = "nSlow",
                             variable = list(n = 100:195), 
                             label = "nSLOW")
            
            add.distribution.constraint(strategy.st,
                                        paramset.label = "EMA",
                                        distribution.label.1 = "nFAST",
                                        distribution.label.2 = "nMED",
                                        operator = "<",
                                        label = "EMA.Constraint")
            
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
                select(Fast, Med, Slow, Profit) %>%
                arrange(desc(Profit))
            
            results$tradeStats
            out
    
            t2 <- Sys.time()
            print(t2-t1)