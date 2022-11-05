databank<-read.table("/Users/davidsmac/Desktop/math/databank.txt", sep=",",
         header=T, na.strings=c("", "NA"))


hic<-crash$hic
sum(hic,na.rm=TRUE)

group=cut(hic,breaks=c(0,400,800,1200,1600,4500),right=FALSE)
count<-table(group)

n<-length(hic)
percent<-count/n*100
percent
cumpct<-cumsum(percent)
cumpct
