#------------------------------------------------+
# - yahoo60m0.bat                                |
# - yahoo60m0.R                                  |
# junyong                                        |
# 201003                                         |
#------------------------------------------------+
# LOCATE THE TWO FILES TO THE DESKTOP            |
#------------------------------------------------+
a=commandArgs(TRUE)

b=paste(a[1],".csv",sep="")
c=a[2]
d=append(c("^gspc","^irx"),sort(a[3:length(a)]))

e=paste(substr(c,1,4),substr(c,6,7),"01",sep="-")
f=seq(as.Date(e),by="month",length=2)-1
g=if(c==f[2]){c}else{f[1]}

h=paste(substr(g,1,4),substr(g,6,7),"01",sep="-")
i=seq(as.Date(h),by="-60 month",length=2)[2]

j=paste("https://query1.finance.yahoo.com/",
    "v7/finance/download/",
    d,
    "?period1=",
    as.integer(as.POSIXct(i,"UTC")),
    "&period2=",
    as.integer(as.POSIXct(g,"UTC")),
    "&interval=1mo",
    sep="")

d[1:2]=c("sp500","tb13")
for(k in 1:length(d))
{
    assign(d[k],read.csv(j[k])$Adj.Close)
}

l=as.matrix(as.data.frame(mget(d)))
m=diff(l)/l[-61,]*100
m[,2]=l[1:60,2]/12

n=seq(as.Date(i),by="month",length=63)[3:62]-1
o=data.frame(date=format(n,"%Y%m"),round(m,4))

p=Sys.getenv("userprofile")
write.csv(o,
	file.path(p,"desktop",b),
	quote=FALSE,
	row.names=FALSE)
