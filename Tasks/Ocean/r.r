#tb <- read.table('Ocean/bottle.csv', sep=',', header = TRUE)
#tb <- tb[, c('Cst_Cnt', 'R_Depth', 'R_TEMP')]
#colnames(tb) <- c('Station', 'Depth', 'Temp')

#tb <- tb[tb$Station %in% 1:70,]
#head(tb)
#write.csv(tb, 'Ocean/ocean_small.csv', row.names=FALSE)

tb <- read.table('Ocean/ocean.csv', sep=',', header = TRUE)
#tb <- tb[, c('Cst_Cnt', 'R_Depth', 'R_TEMP')]
#colnames(tb) <- c('Station', 'Depth', 'Temp')

tb <- tb[tb$Station %in% 1:70,]
#head(tb)
write.csv(tb, 'Ocean/ocean_small.csv', row.names=FALSE)

