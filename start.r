databank<-read.table("/Users/davidsmac/Desktop/math/databank.txt", sep=",",
         header=T, na.strings=c("", "NA"))

#question 2
hic<-crash$hic
sum(hic,na.rm=TRUE)

group=cut(hic,breaks=c(0,400,800,1200,1600,4500),right=FALSE)
count<-table(group)

n<-length(hic)
percent<-count/n*100
percent
cumpct<-cumsum(percent)
cumpct

#question3:
protection<-crash$protection
ll<-crash$l.leg
cutpoints<-c(0,500,1000,1500,2000,2500,3000,3500)
manual_belts<-ll[protection=="manual belts"]

hist(manual_belts,breaks=cutpoints,labels=TRUE,right=FALSE,col="green",
   xaxt="n",main="Left leg",xlab="Weight")
axis(side=1,at=cutpoints)

dbag<-ll[protection=="d airbag"]
hist(dbag,breaks=cutpoints,labels=TRUE,right=FALSE,col="red",
   xaxt="n",main="Left leg",xlab="Weight")
axis(side=1,at=cutpoints)


#question 4:
weight<-crash$wt
weight_kg<-weight**0.4536
library("aplpack")
stem.leaf(weight_kg,na.rm=T,trim.outliers=F,m=1)

#question 6:
size<-crash$size
bplot<-boxplot(hic~size,data=crash,main=
  "Boxplot of hic by size",
   xlab="size",ylab="hic",col="lightslateblue")
stats<-bplot$stats

mean<-tapply(hic,size,mean,na.rm=T)
sd<-tapply(hic,size,sd,na.rm=T)
n<-tapply(hic,size,length)
max(hic,na.rm=T)
