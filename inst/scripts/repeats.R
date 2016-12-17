repeats_gr <- as(repeats, "GRanges")
repeats_p53 <- gmapR:::translateToP53Genome(repeats_gr)
repeats_p53 <- trim(repeats_p53)
repeats <- repeats_p53
repeats <- subset(repeats, repClass %in% c("Low_complexity", "Simple_repeat"))
save(repeats, file="../../data/repeats.rda")
