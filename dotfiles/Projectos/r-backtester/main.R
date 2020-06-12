          suppressPackageStartupMessages(library(knitr))
          suppressPackageStartupMessages(library(lubridate))
          suppressPackageStartupMessages(library(tidyverse))
          suppressPackageStartupMessages(library(quantstrat))
          suppressPackageStartupMessages(library(highcharter))
          suppressPackageStartupMessages(library(IKTrading))
          suppressPackageStartupMessages(library(doParallel))
          suppressPackageStartupMessages(library(dplyr))
          t1 <- Sys.time()
          registerDoParallel(cores=detectCores())
          
          # ---------------------------------------------------- #
          t1 <- Sys.time()
          init_date <- "2004-10-25 01:00:00"
          init_equity <- 200
          
          start_date <- "2005::"
          
          stoploss <- 0.24
          profitLong <- 1.8
          profitSell <- 7.4
          
          emaF <- 8  #S->8   || B->3
          emaM <- 28  #S->28  || B->4
          emaS <- 195 #S->195 || B-> 22
          wdayBuy <- c(2,4,5,7) #c(2,4,5,7)
          wdaySell <- c(1,6)    #c(1,6)
          # ---------------------------------------------------- #
          
          setwd("/home/sorath/Projectos/r-backtester")
          Sys.setenv(TZ = "UTC")
          currency("EUR")
          portfolio.st <- "Port.Luxor"
          account.st <- "Acct.Luxor"
          strategy.st <- "Strat.Luxor"
          rm.strat(portfolio.st)
          rm.strat(account.st)
          source("heikin.R")
          source("myblotter.R")
          source("strat.R")
          source("rules.R")
          
          rets <- PortfReturns(Account = account.st)
          txs <- as.data.frame(getTxns(portfolio.st, symbols))[-c(1),]
          txsClosed <- txs[ c(FALSE,TRUE),]
          
          LS_Stats <- function(y) {
            if (y == "long") {
              pos <- -1
              side <- c("Total (Long)", "SumProfit (Long)", "SumLoss (Long)", "ProfitFactor (Long)")
            } else if (y == "short") {
              pos <- 1
              side <- c("Total (Short)", "SumProfit (Short)", "SumLoss (Short)", "ProfitFactor (Short)")}
          
          txs.Profit <- txsClosed[txsClosed$Txn.Qty == pos & txsClosed$Net.Txn.Realized.PL >= 0, ]
          txs.Loss <- txsClosed[txsClosed$Txn.Qty == pos & txsClosed$Net.Txn.Realized.PL < 0, ]
          SumProfit <- sum(txs.Profit["Net.Txn.Realized.PL"])
          SumLoss <- sum(txs.Loss["Net.Txn.Realized.PL"])
          SumTxs <- SumProfit+SumLoss
          ProfitFactor <- abs(SumProfit/SumLoss)
          TotalStats <- side
          Values <- c(SumTxs, SumProfit, SumLoss, ProfitFactor)
          data.frame(TotalStats, Values)
          }
          
          sumTrades <- function(x) {
            if (x == "long") {
              pos <- 1
            } else if (x == "short") {
              pos <- -1}
          listLong <- txsClosed[txsClosed$Txn.Qty == pos & txsClosed$Net.Txn.Realized.PL >= 0, ]
          cumsum(listLong["Net.Txn.Realized.PL"])
          }
          
          orders <- as.data.frame(getOrders(portfolio.st, symbols, status = "closed"))
          ordersCols <- orders[,c("Order.Qty", "Order.Price",	"Order.Type",	"Order.Side",	"Order.Threshold",	"Order.Status", "Order.StatusTime",	"Order.Set",	"Rule",	"Time.In.Force")]
          tbind <- cbind(txs, ordersCols)
          
          startOrders <- tbind[ c(TRUE,FALSE), ]
          endOrders <- tbind[ c(FALSE,TRUE), ]
          sID <- startOrders[,c("Txn.Price","Order.Side","Rule")]
          startOrdersFilter <- cbind(sID, "ID"=1:nrow(sID))
          eID <- endOrders[,c("Txn.Price","Rule")] %>%
            rename(
                   "Txn.Price.Close" = Txn.Price,
                   "Rule.Close" = Rule)
          
          endOrdersFilter <- cbind(eID, "ID"=1:nrow(eID))
          
          bindThem <- merge(data.frame(startOrdersFilter, row.names=NULL), data.frame(endOrdersFilter, row.names=NULL), by = "ID", all = TRUE)[-1]
          cleanThem <- bindThem[!is.na(bindThem$Rule.Close),]
          
          tradeStats <- perTradeStats(portfolio.st, symbols, includeOpenTrade = FALSE)
          tradeStatsFilter <- tradeStats[,c("Start", "End","Net.Trading.PL", "Pct.Net.Trading.PL", "duration")]
          tradeStatsMerge <- cbind(tradeStatsFilter,cleanThem)
          tradeStatsOrder <- tradeStatsMerge[,c("Start", "End", "Order.Side", "Txn.Price", "Rule", "Net.Trading.PL",	"Pct.Net.Trading.PL", "Txn.Price.Close", "Rule.Close", "duration")] %>%
            rename(
                   Position = Order.Side,
                   "Entry.Price" = Txn.Price,
                   "Entry.Rule" = Rule,
                   "PL" = Net.Trading.PL,
                   "PL (%)" = Pct.Net.Trading.PL,
                   "Close.Price" = Txn.Price.Close,
                   "Close Rule" = Rule.Close,
                   "Duration" = duration)
          
          arTab <- table.AnnualizedReturns(rets)
          max.risk <- max(arTab["Annualized Std Dev",])
          max.return <- max(arTab["Annualized Return",])
          a <- getAccount(account.st)
          equity = a$summary$End.Eq[start_date]
          
          chart.Posn(portfolio.st, Symbol = symbols)
          quanTiles <- tradeQuantiles(portfolio.st, symbols, scale = c("cash", "percent", "tick"),
                                      probs = c(0.5, 0.75, 0.9, 1))
          
          chart.ME(Portfolio=portfolio.st, Symbol=symbols, type='MAE', scale='cash')
          chart.ME(Portfolio=portfolio.st, Symbol=symbols, type='MFE', scale='cash')
          chart.Boxplot(rets, main = "EURUSD Returns", colorset= rich10equal)
          
          charts.PerformanceSummary(apply.monthly(rets, Return.cumulative),
                                   colorset = bluefocus, main = "Strategy Performance")
          
          
          chart.RiskReturnScatter(rets,
                                  main = "EURUSD Performance", colorset = rich10equal,
                                  xlim = c(0, max.risk * 1.1), ylim = c(0, max.return))
          chart.RiskReturnScatter(rets, Rf = 0, add.sharpe = c(1, 2),
                                  main = "Return vs. Risk", colorset = c("red", "blue"))

          quanTiles <- tradeQuantiles(portfolio.st, symbols, scale = c("cash", "percent", "tick"),
                                      probs = c(0.5, 0.75, 0.9, 1))
          
          hchart(equity, color = "black", name = "PL") %>%
           hc_title(text = "Equity")
          
          tradeStatsOrder$weekday <- wday(tradeStatsOrder[,1])
          tradeStatsOrder
          monday <- filter(tradeStatsOrder, weekday == '1')
          sum(monday$PL)
          
          source("highchart.R")
          chartplot
          
          kable(t(dailyStats(portfolio.st)))
          kable(t(tradeStats(portfolio.st)))
          kable(LS_Stats("long"))
          kable(LS_Stats("short"))

          yearlyReturn(equity) * 200
          
          t2 <- Sys.time()
          print(t2-t1)