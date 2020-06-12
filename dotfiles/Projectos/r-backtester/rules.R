# add.rule(strategy.st, name = "ruleSignal",
#          arguments = list(sigcol = "longentry",
#                           sigval = TRUE,
#                           orderqty = 1,
#                           ordertype = "market",
#                           orderside = "long",
#                           TxnFees = 0,
#                           prefer= "Open",
#                           osFUN=osMaxPos,
#                           replace = FALSE),
#          type = "enter",
#          timespan = "T09:00/T11:00", #"T10:00/T11:00" // "T09:00/T11:00" // "T01:00/T03:00" // "T05:00/T06:00"
#          label = "EnterLONG")
# 
# add.rule(strategy.st, name = "ruleSignal",
#          arguments = list(sigcol = "longentry",
#                           sigval = TRUE,
#                           orderqty = 1,
#                           ordertype = "market",
#                           orderside = "long",
#                           TxnFees = 0,
#                           prefer= "Open",
#                           osFUN=osMaxPos,
#                           replace = FALSE),
#          type = "enter",
#          timespan = "T01:00/T03:00",
#          label = "EnterLONG")

    # add.rule(strategy.st, name = "ruleSignal",
    #          arguments = list(sigcol = "longExit",
    #                           sigval = TRUE,
    #                           orderqty = "all",
    #                           ordertype = "market",
    #                           orderside = "long",
    #                           TxnFees = 0,
    #                            prefer= "Open",
    #                           replace = FALSE),
    #          type = "exit",
    #          label = "Exit2SHORT")

# add.rule(strategy.st, name = "ruleSignal",
#          arguments = list(sigcol = "longentry" ,
#                           sigval = TRUE,
#                           orderqty = "all",
#                           ordertype = "stoplimit",
#                           orderside = "long",
#                           TxnFees = 0,
#                           threshold = quote(stoploss),
#                           replace = TRUE),
#          type = "chain",
#          parent = "EnterLONG",
#          label = "StopLossLONG",
#          enabled = TRUE)
# 
# add.rule(strategy.st, name = "ruleSignal",
#          arguments = list(sigcol = "longentry" ,
#                           sigval = TRUE,
#                           orderqty = "all",
#                           ordertype = "limit",
#                           orderside = "long",
#                           TxnFees = 0,
#                           threshold = quote(profitLong),
#                           replace = FALSE),
#          type = "chain",
#          parent = "EnterLONG",
#          label = "ProfitLONG",
#          enabled = TRUE)

add.rule(strategy.st, name = "ruleSignal",
         arguments = list(sigcol = "shortentry",
                          sigval = TRUE,
                          orderqty = -1,
                          ordertype = "market",
                          orderside = "short",
                          TxnFees = 0,
                          prefer= "Open",
                          osFUN=osMaxPos,
                          replace = FALSE),
         type = "enter",
         timespan = "T10:00/T18:00", #T10:00/T18:00 || T01:00/T02:00->2.09 || T13:00/T14:00->2.77
         label = "EnterSHORT")

# add.rule(strategy.st, name = "ruleSignal",
#          arguments = list(sigcol = "longExit",
#                           sigval = TRUE,
#                           orderqty = "all",
#                           ordertype = "market",
#                           orderside = "short",
#                           TxnFees = 0,
#                            prefer= "Open",
#                           replace = FALSE),
#          type = "exit",
#          label = "Exit2LONG")

add.rule(strategy.st, name = "ruleSignal",
         arguments = list(sigcol = "shortentry",
                          sigval = TRUE,
                          orderqty = "all",
                          ordertype = "stoplimit",
                          orderside = "short",
                          TxnFees = 0,
                          threshold = quote(stoploss),
                          replace = TRUE),
         type = "chain",
         parent = "EnterSHORT",
         label = "StopLossSHORT",
         enabled = TRUE)

add.rule(strategy.st, name = "ruleSignal",
         arguments = list(sigcol = "shortentry" ,
                          sigval = TRUE,
                          orderqty = "all",
                          ordertype = "limit",
                          orderside = "short",
                          TxnFees = 0,
                          threshold = quote(profitSell),
                          replace = FALSE),
         type = "chain",
         parent = "EnterSHORT",
         label = "ProfitSHORT",
         enabled = TRUE)

results_file <- paste("results", strategy.st, "RData", sep = ".")
if( file.exists(results_file) ) {
    load(results_file)
} else {
    results <- applyStrategy(strategy.st, portfolios = portfolio.st)
    updatePortf(portfolio.st)
    updateAcct(account.st)
    updateEndEq(account.st)
    if(checkBlotterUpdate(portfolio.st, account.st, verbose = FALSE)) {
        save(list = "results", file = results_file)
        save.strategy(strategy.st)
    }
}

suppressWarnings({applyStrategy(strategy.st, portfolios = portfolio.st, verbose=FALSE)})
suppressWarnings({updatePortf(portfolio.st)})
updateAcct(account.st)
updateEndEq(account.st)
