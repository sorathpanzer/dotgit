#EURUSD <- as.data.frame(read.zoo("EURUSD.csv", header = TRUE, stringsAsFactors = FALSE, sep = ",", index = 1:2,
#tz = "UTC", format = "%d.%m.%Y %H:%M"))
#getSymbols("AAPL", src = "yahoo", from = start, to = end)

getSymbols("GBP", src = "yahoo")
EURUSD <- GBP
#read.zoo(EURUSD)
#EURUSD <- na.omit(EURUSD)
#EURUSD <- as.xts(EURUSD)
EURUSD <- EURUSD[start_date]
symbols <- c("EURUSD")
EURUSD$weekday <- wday(index(EURUSD))

ind <- substr(index(EURUSD), 1, 10)
endYear <- as.character(seq(as.Date("2004-12-31"), by = "year", length.out = 20))
EURUSD$endYear <- ind %in% endYear
