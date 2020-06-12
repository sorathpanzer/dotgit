

```r
add.indicator(strategy.st, name = "EMA",
              arguments = list(x = quote(Cl(market(ha_EURUSD, 1))),
                               n = emaF),
              label = "nFast")
```

```
## [1] "Strat.Luxor"
```

```r
add.indicator(strategy.st, name = "EMA",
              arguments = list(x = quote(Cl(market(ha_EURUSD, 1))),
                               n = emaM),
              label = "nMed")
```

```
## [1] "Strat.Luxor"
```

```r
add.indicator(strategy.st, name = "EMA",
              arguments = list(x = quote(Cl(market(ha_EURUSD, 1))),
                               n = emaS),
              label = "nSlow")
```

```
## [1] "Strat.Luxor"
```

```r
buysig <- function(data) {
  sig <- data[, "EMA.nSlow"] > market(ha_EURUSD$ha.Close, 1) & EURUSD$weekday == wdayBuy
  colnames(sig) <- "upSig"
  sig
}

sellsig <- function(data) {
  sig <- data[, "EMA.nSlow"] < market(ha_EURUSD$ha.Close, 1) & EURUSD$weekday == wdaySell
  colnames(sig) <- "downSig"
  sig
}

# closeSig <- function(data) {
#   sig <- EURUSD$endYear == c(1)
#   colnames(sig) <- "closeSig"
#   sig
# }

add.signal(strategy.st, name="buysig",
           arguments = list(data = quote(mktdata)),
           label = "long")
```

```
## [1] "Strat.Luxor"
```

```r
add.signal(strategy.st, name="sellsig",
           arguments = list(data = quote(mktdata)),
           label = "sell")
```

```
## [1] "Strat.Luxor"
```

```r
add.signal(strategy.st, name="sigComparison",
           arguments = list(columns = c("nFast", "nMed"),
                            relationship = "gt"),
           label = "longsig2")
```

```
## [1] "Strat.Luxor"
```

```r
add.signal(strategy.st, name="sigComparison",
           arguments = list(columns = c("nFast", "nMed"),
                            relationship = "lt"),
           label = "shortsig2")
```

```
## [1] "Strat.Luxor"
```

```r
add.signal(strategy.st, name = "sigFormula",
           arguments = list(formula = "upSig.long & longsig2",
                            cross = TRUE),
           label = "longentry")
```

```
## [1] "Strat.Luxor"
```

```r
add.signal(strategy.st, name = "sigFormula",
           arguments = list(formula = "downSig.sell & shortsig2",
                            cross = TRUE),
           label = "shortentry")
```

```
## [1] "Strat.Luxor"
```

```r
# add.signal(strategy.st, name="closeSig",
#            arguments = list(data = quote(mktdata)),
#            label = "loopy")
# 
# add.signal(strategy.st, name = "sigFormula",
#            arguments = list(formula = "closeSig.loopy",
#                             cross = TRUE),
#            label = "longExit")
```

