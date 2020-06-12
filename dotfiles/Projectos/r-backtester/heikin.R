EURUSD <- as.data.frame(read.zoo("EURUSD.csv", header = TRUE, stringsAsFactors = FALSE, sep = ",", index = 1:2,
tz = "UTC", format = "%d.%m.%Y %H:%M"))
EURUSD <- as.xts(EURUSD)
EURUSD <- EURUSD[start_date]
symbols <- c("EURUSD")
EURUSD$weekday <- wday(index(EURUSD))

ind <- substr(index(EURUSD), 1, 10)
endYear <- as.character(seq(as.Date("2004-12-31"), by = "year", length.out = 20))
EURUSD$endYear <- ind %in% endYear

Rcpp::cppFunction('NumericMatrix RawHeikinAshi(NumericMatrix x, CharacterVector n) {
// assumes OHLC matrix input
int nrow = x.nrow(), ncol = 4, Op=0, Hi=1, Lo=2, Cl=3;
NumericMatrix ha(nrow,ncol);
for (int i = 0; i < nrow; i++) {
    ha(i, Cl) = (x(i,Op) + x(i,Hi) + x(i,Lo) + x(i,Cl)) / 4.0;
    ha(i, Op) = (i > 0) ? ((ha(i - 1, Op) + ha(i - 1, Cl)) / 2.0) : x(i, Op);
    ha(i, Hi) = std::max(x(i, Hi), std::max(ha(i, Op), ha(i, Cl)));
    ha(i, Lo) = std::min(x(i, Lo), std::min(ha(i, Op), ha(i, Cl)));
}
colnames(ha) = n;
return ha;
}')

# HAOHLC <- function(x) {
#     x <- OHLC(try.xts(x))
#     r <- RawHeikinAshi(x, paste0("ha.", colnames(x)))
#     return(reclass(r, x))
# }
# 
# ha_EURUSD <- as.xts(HAOHLC(EURUSD))

ha_EURUSD <- EURUSD

market <- function(z,y) {
  rollapplyr(z[start_date], y, function(x) x[1])
}