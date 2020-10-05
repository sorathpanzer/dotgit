buysig <- function(data) {
  sig <- EURUSD$weekday == wdayBuy
  colnames(sig) <- "upSig"
  sig
}

sellsig <- function(data) {
  sig <- EURUSD$weekday == wdaySell
  colnames(sig) <- "downSig"
  sig
}

add.signal(strategy.st, name="buysig",
           arguments = list(data = quote(mktdata)),
           label = "long")

add.signal(strategy.st, name="sellsig",
           arguments = list(data = quote(mktdata)),
           label = "sell")

add.signal(strategy.st, name = "sigFormula",
           arguments = list(formula = "upSig.long",
                            cross = TRUE),
           label = "longentry")

add.signal(strategy.st, name = "sigFormula",
           arguments = list(formula = "downSig.sell",
                            cross = TRUE),
           label = "shortentry")


