library(quantmod)
library(ggplot2)
library(magrittr)

start_date <- as.Date("2008-01-03")
dataEnv<-new.env()

STOCK <- `XRX`
SYMBOL <- c("XRX")
length(SYMBOL)

#getSymbols(SYMBOL, from = start_date)
getSymbols(SYMBOL, src = "yahoo", from = start_date)
getSymbols("SPY", from = start_date)
na.omit(SYMBOL)
na.omit(STOCK)

CPR <- STOCK/SPY

candleChart(STOCK, up.col = "green", dn.col = "red", theme = "black")
candleChart(CPR, up.col = "green", dn.col = "red", theme = "black")