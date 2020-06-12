start <- tradeStatsOrder$Start
end <- tradeStatsOrder$End
buy <- tradeStatsOrder[tradeStatsOrder$Entry.Rule == "EnterLONG", ]
sell <- tradeStatsOrder[tradeStatsOrder$Entry.Rule == "EnterSHORT", ]
startBuy <- buy$Start
startBuy_df <- as.data.frame(startBuy)
startSell <- sell$Start
startSell_df <- as.data.frame(startSell)

endBuy <- buy$End
endBuy_df <- as.data.frame(endBuy)
entryPrice <- tradeStatsOrder[,"Entry.Price"]
closePrice <- tradeStatsOrder[,c("Close.Price")]
endSell <- sell$End
endSell_df <- as.data.frame(endSell)


sprice <- as.data.frame(tradeStatsOrder[,c("Entry.Price")])
direction <- as.data.frame(tradeStatsOrder[,c("Entry.Rule")])
sprice$Number <-as.numeric(as.character(sprice[,1]))
sl <- ifelse(direction == "EnterLONG",sprice$Number-stoploss,sprice$Number+stoploss)
sloss <- as.numeric(as.character(sl[,1]))

strp <- function(x) list(
  color = "rgba(68, 170, 213, 0.1)",
  from = datetime_to_timestamp(as.POSIXct(startBuy_df[x,1])),
  to = datetime_to_timestamp(as.POSIXct(endBuy_df[x,1])))

srun <- function(x) list(
  color = "rgba(191, 4, 4, 0.1)",
  from = datetime_to_timestamp(as.POSIXct(startSell_df[x,1])),
  to = datetime_to_timestamp(as.POSIXct(endSell_df[x,1])))

tablepoints <- cbind(entryPrice, closePrice, sloss)

chartplot <- highchart(type = "stock") %>% 
              hc_add_series(EURUSD) %>%
              hc_add_series(tibble::enframe(name = NULL, entryPrice), type = "scatter", marker = list(symbol = "plus"), color = "green", hcaes(x = datetime_to_timestamp(start), y = entryPrice)) %>%
              hc_add_series(tibble::enframe(name = NULL, closePrice), type = "scatter", marker = list(symbol = "plus"), color = "red", hcaes(x = datetime_to_timestamp(end), y = closePrice)) %>%
              hc_add_series(tibble::enframe(name = NULL, sloss), type = "line", step = TRUE, lineWidth = 1, color = "red", hcaes(x = datetime_to_timestamp(start), x3 = datetime_to_timestamp(end), y = sloss)) %>%
              hc_xAxis(plotBands = list(
                strp(1), strp(2), strp(3), strp(4), strp(5), strp(6), strp(7), strp(8), strp(9), strp(10), strp(11), strp(12), strp(13), strp(14), strp(15), strp(16), strp(17), strp(18), strp(19), strp(20), 
                strp(21), strp(22), strp(23), strp(24), strp(25), strp(26), strp(27), strp(28), strp(29), strp(30), strp(31), strp(32), strp(33), strp(34), strp(35), strp(36), strp(37), strp(38), strp(39), strp(40),
                strp(41), strp(42), strp(43), strp(44), strp(45), strp(46), strp(47), strp(48), strp(49), strp(50), strp(51), strp(52), strp(53), strp(54), strp(55), strp(56), strp(57), strp(58), strp(59), strp(60), 
                strp(61), strp(62), strp(63), strp(64), strp(65), strp(66), strp(67), strp(68), strp(69), strp(70), strp(71), strp(72), strp(73), strp(74), strp(75), strp(76), strp(77), strp(78), strp(79), strp(80), 
                strp(81), strp(82), strp(83), strp(84), strp(85), strp(86), strp(87), strp(88), strp(89), strp(90), strp(91), strp(92), strp(93), strp(94), strp(95), strp(96), strp(97), strp(98), strp(99), strp(100), 
                strp(101), strp(102), strp(103), strp(104), strp(105), strp(106), strp(107), strp(108), strp(109), strp(110), strp(111), strp(112), strp(113), strp(114), strp(115), strp(116), strp(117), strp(118), strp(119), strp(120),
                strp(130), strp(131), strp(132), strp(133), strp(134), strp(135), strp(136), strp(137), strp(138), strp(139), strp(140), strp(141), strp(142), strp(143), strp(144), strp(145), strp(146), strp(147), strp(148), strp(149), strp(150),
                srun(1), srun(2), srun(3), srun(4), srun(5), srun(6), srun(7), srun(8), srun(9), srun(10), srun(11), srun(12), srun(13), srun(14), srun(15), srun(16), srun(17), srun(18), srun(19), srun(20), 
                srun(21), srun(22), srun(23), srun(24), srun(25), srun(26), srun(27), srun(28), srun(29), srun(30), srun(31), srun(32), srun(33), srun(34), srun(35), srun(36), srun(37), srun(38), srun(39), srun(40),
                srun(41), srun(42), srun(43), srun(44), srun(45), srun(46), srun(47), srun(48), srun(49), srun(50), srun(51), srun(52), srun(53), srun(54), srun(55), srun(56), srun(57), srun(58), srun(59), srun(60), 
                srun(61), srun(62), srun(63), srun(64), srun(65), srun(66), srun(67), srun(68), srun(69), srun(70), srun(71), srun(72), srun(73), srun(74), srun(75), srun(76), srun(77), srun(78), srun(79), srun(80), 
                srun(81), srun(82), srun(83), srun(84), srun(85), srun(86), srun(87), srun(88), srun(89), srun(90), srun(91), srun(92), srun(93), srun(94), srun(95), srun(96), srun(97), srun(98), srun(99), srun(100), 
                srun(101), srun(102), srun(103), srun(104), srun(105), srun(106), srun(107), srun(108), srun(109), srun(110), srun(111), srun(112), srun(113), srun(114), srun(115), srun(116), srun(117), srun(118), srun(119), srun(120),
                srun(130), srun(131), srun(132), srun(133), srun(134), srun(135), srun(136), srun(137), srun(138), srun(139), srun(140), srun(141), srun(142), srun(143), srun(144), srun(145), srun(146), srun(147), srun(148), srun(149), srun(150)
              )) %>%
              hc_rangeSelector( buttons = list(
                list(type = 'week', count = 1, text = '1H'),
                list(type = 'week', count = 4, text = '4H'),
                list(type = 'week', count = 24, text = '1D'),
                list(type = 'all', text = 'All')
              ))