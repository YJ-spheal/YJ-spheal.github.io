UN18 <- scan(file="BTS_UN2018.txt", what="", quote=NULL, encoding="UTF-8")
UN18 <- gsub('^[[:punct:]]*|[[:punct:]]$','',tolower(UN18))
UN18.table <- sort(table(UN18),decreasing=T)
UN18.Freq <- data.frame(UN18.table)
head(UN18.Freq,15)

UN20 <- scan(file="BTS_UN2020.txt", what="", quote=NULL, encoding="UTF-8")
UN20 <- gsub('^[[:punct:]]*|[[:punct:]]$','',tolower(UN20))
UN20.table <- sort(table(UN20),decreasing=T)
UN20.Freq <- data.frame(UN20.table)
head(UN20.Freq,15)

UN18 <- vector()
UN20 <- vector()
for (i in list.files(path = "./", pattern='[.]txt$'))
{
TEXT <- scan(file=paste("./",i,sep=""), what="", quote=NULL, encoding="UTF-8")
TEXT <- gsub('^[[:punct:]]*|[[:punct:]]$','',tolower(TEXT))
year <- as.numeric(substring(i,7,10))
if (year == 2018)
{
UN18 <- TEXT
}
else
{
UN20 <- TEXT
}
}

UNtotal <- c(UN18, UN20)
UNtotal.table <- sort(table(UNtotal),decreasing=T)
UNtotal.Freq <- data.frame(UNtotal.table)
head(UNtotal.Freq,15)


bi.grams <- paste(UNtotal[1:(length(UNtotal)-1)], UNtotal[2:length(UNtotal)])
bi.grams.Freq <- data.frame(sort(table(bi.grams),decreasing = T))
head(bi.grams.Freq,15)

tri.grams <- paste(UNtotal[1:(length(UNtotal)-2)], UNtotal[2:(length(UNtotal)-1)],UNtotal[3:length(UNtotal)])
tri.grams.Freq <- data.frame(sort(table(tri.grams),decreasing = T))
head(tri.grams.Freq,15)

UN18.table <- sort(table(UN18),decreasing=T)
UN18.Freq <- data.frame(UN18.table)
head(UN18.Freq,15)

UN20.table <- sort(table(UN20),decreasing=T)
UN20.Freq <- data.frame(UN20.table)
head(UN20.Freq,15)



length(union(UN18,UN20))
UNtotal.TDM <- merge(UN18.Freq, UN20.Freq, by.x="UN18", by.y = "UN20", all=T)
UNtotal.TDM <- data.frame(row.names = UNtotal.TDM$UN18, UNtotal.TDM[2:3])
UNtotal.TDM[is.na(UNtotal.TDM)] <- 0
head(UNtotal.TDM)

library(wordcloud)
comparison.cloud(UNtotal.TDM[c(1,2)], random.order = FALSE, scale = c(3,0.1),
rot.per = 0.4, max.words = 200, colors = brewer.pal(8,"Dark2"), title.size=1)

stop <- readLines('EnglishStopwords.txt')
TDM <- UNtotal.TDM[!(rownames(UNtotal.TDM) %in% stop), ]
head(TDM)

plot(hclust(dist(scale(TDM[1:20, ]), method="minkowski"), method="ward.D2"))

install.packages("AMR")
library(AMR)
PCA <- prcomp(scale(TDM[1:30, ]))
ggplot_pca(PCA,labels = rownames(TDM[1:30, ]))