library('scales')

df <- read.table('Ocean/ocean.csv', sep=',', header = TRUE)
#df <- df[complete.cases(df), ]
#df <- df[!(df$Station %in% c(NA)),]
df <- df[(df$Station %in% 10000:10001),]

degree <- 30

sep <- rbinom(nrow(df), 1, 0.85)

testData <- df[sep == 0, ]
trainData <- df[sep == 1, ]

fit.train = lm (Temp ~ poly(Depth,degree,raw= T) + Station, data=trainData)
print(summary(fit.train))
fit.test = predict (fit.train, newdata=testData)

colors <- rainbow(max(df$Station))

png('Ocean/plot.png')

#plot(testData$Temp, fit.test, xlim=c(0, 20), ylim=c(0,20), col=alpha(colors[testData$Station], 0.4))

a <- 1
s <- -2
l <- 40
d <- 1

plot(testData$Temp, fit.test, xlim=c(0, 20), ylim=c(0,20), col=alpha('black', a))


lines(c(s, l), c(s, l), type='l', col='purple')
lines(c(s, l), c(s+d, l+d), type='l', col='green')
lines(c(s, l), c(s-d, l-d), type='l', col='green')
lines(c(s, l), c(s+2*d, l+2*d), type='l', col='yellow')
lines(c(s, l), c(s-2*d, l-2*d), type='l', col='yellow')
lines(c(s, l), c(s+3*d, l+3*d), type='l', col='red')
lines(c(s, l), c(s-3*d, l-3*d), type='l', col='red')
#legend("left", legend = 1:max(df$Station),
#       lwd = 3, col = colors)

dev.off()

testData$D <- sqrt((testData$Temp - fit.test)^2)

St <- testData[testData$D >= 2,]$Station

print(max(testData$D))
#u <- unique(St)
#tab <- tabulate(match(St, u))

#print(u[tab == max(tab)])
#print(max(tab))














#df <- df[!(df$Station %in% St),]
#write.csv(df, 'Ocean/ocean_small.csv', row.names=FALSE)