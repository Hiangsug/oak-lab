setwd('/Users/tian/Desktop/ALLSUB')

mycsvfile = list.files(pattern="*.csv")

#SUBdata1=read.csv(mycsvfile[2],header=F)

name=10

SUBdata=read.csv(mycsvfile[name],header=T)
size=1794
SUBdata[which(is.na(SUBdata),arr.ind = T)]<-0 

#sum1=sum(SUBdata[i,10]+SUBdata[i,9]+SUBdata[i,8]+SUBdata[i,7]+SUBdata[i,6],na.rm=TRUE)
#na.rm=TRUE
for (i in 1:size)  
      SUBdata[i,16]=3
for (i in 1:size)
  # sum1= SUBdata[i,10]+SUBdata[i,9]+SUBdata[i,8]+SUBdata[i,7]+SUBdata[i,6]
  # sum2=SUBdata[i,15]+SUBdata[i,11]+SUBdata[i,12]+SUBdata[i,13]+SUBdata[i,14]
  if (SUBdata[i,10]>0 |SUBdata[i,9]>0 |SUBdata[i,8]>0|SUBdata[i,7]>0|SUBdata[i,6]>0)
      SUBdata[i,16]=1
for (i in 1:size)  
  if (SUBdata[i,11]>0 |SUBdata[i,12]>0 |SUBdata[i,13]>0|SUBdata[i,14]>0|SUBdata[i,15]>0)
      SUBdata[i,16]=2


for (i in 1:size)
  if (SUBdata[i,16]==1 && SUBdata[i,3]=='00-01.jpg')
    SUBdata[i,17]=1
for (i in 1:size)  
  if (SUBdata[i,16]==2 && SUBdata[i,3]=='00-01.jpg')
    SUBdata[i,17]=2
for (i in 1:size)
  if (SUBdata[i,16]==1 && SUBdata[i,3]=='01-00.jpg')
    SUBdata[i,17]=2
for (i in 1:size)  
  if (SUBdata[i,16]==2 && SUBdata[i,3]=='01-00.jpg')
    SUBdata[i,17]=1

#SUBdata_omit<-na.omit(SUBdata)


for (i in 1:size) 
  if (SUBdata[i,16]==1 & SUBdata[i,3]=='01-10.jpg')
  SUBdata[i,17]=1
for (i in 1:size)  
  if (SUBdata[i,16]==2 & SUBdata[i,3]=='01-10.jpg')
    SUBdata[i,17]=3
for (i in 1:size)
  if (SUBdata[i,16]==1 & SUBdata[i,3]=='01-10.jpg')
    SUBdata[i,17]=3
for (i in 1:size)  
  if (SUBdata[i,16]==2 & SUBdata[i,3]=='01-10.jpg')
    SUBdata[i,17]=1

for (i in 1:size) 
  if (SUBdata[i,16]==1 & SUBdata[i,3]=='00-10.jpg')
    SUBdata[i,17]=2
for (i in 1:size)  
  if (SUBdata[i,16]==2 & SUBdata[i,3]=='00-10.jpg')
    SUBdata[i,17]=3
for (i in 1:size)
  if (SUBdata[i,16]==1 & SUBdata[i,3]=='10-00.jpg')
    SUBdata[i,17]=3
for (i in 1:size)  
  if (SUBdata[i,16]==2 & SUBdata[i,3]=='10-00.jpg')
    SUBdata[i,17]=2


for (i in 1:size)
  if (SUBdata[i,3]=='01-00.jpg'| SUBdata[i,3]=='00-01.jpg')
    SUBdata[i,18]=12
for (i in 1:size)
  if (SUBdata[i,3]=='10-00.jpg'| SUBdata[i,3]=='00-10.jpg')
    SUBdata[i,18]=23
for (i in 1:size)
  if (SUBdata[i,3]=='01-10.jpg'| SUBdata[i,3]=='10-01.jpg')
    SUBdata[i,18]=13

#SUBdata_omit=t(matrix(,17));
#SUBdata_omit=t(matrix(,17));
# for (i in 1:2006)
#   if (SUBdata[i,16]==2|SUBdata[i,16]==1)
#     break
# m=i;
# 
# SUBdata_omit=SUBdata[m,]
# m=m+1
# for (i in m[1]:2006)
#   if (SUBdata[i,16]==2|SUBdata[i,16]==1)
#     SUBdata_omit=rbind(SUBdata_omit,SUBdata[i,])
    
    
    
#     subdata2= rbind(subdata2,SUBdata[i,])


SUBdata_omit<-na.omit(SUBdata)
SUBdata_output=cbind(SUBdata_omit[,2],SUBdata_omit[,4:5],SUBdata_omit[,17:18])
names(SUBdata_output)=c("GazeDuration","Blcok","Test","Picture","Condition")

file=paste(mycsvfile[name])
setwd('/Users/tian/Desktop/ALLSUB/ANALYSIS')
write.csv(SUBdata_output,file,row.names = T)


  # for (i in 2:2007)
  #   if (SUBdata[i,5]=='test2')
  #     subdata2= rbind(subdata2,SUBdata[i,])
  # for (i in 2:2007)
  #   if (SUBdata[i,5]=='test3')
  #     subdata3= rbind(subdata3,SUBdata[i,])


# library(sqldf)
# sqldf('select StudioTestName, sum(left5) from SUBdata group by StudioTestName')
# 
# library(reshape)
# library(reshape2)
# #subl1=aggregate(SUBdata$StudioTestName,by=list(MediaName=MediaName),mean)
# subl5=cast(SUBdata,StudioTestName~MediaName,value='GazeEventDuration')
# subl1=cast(SUBdata,StudioTestName~MediaName,value='left1')
# subl2=cast(SUBdata,StudioTestName~MediaName,value='left2')
# subl3=cast(SUBdata,StudioTestName~MediaName,value='left3')
# subl4=cast(SUBdata,StudioTestName~MediaName,value='left4')
# 
# subr5=cast(SUBdata,StudioTestName~MediaName,value='right5')
# subr1=cast(SUBdata,StudioTestName~MediaName,value='right1')
# subr2=cast(SUBdata,StudioTestName~MediaName,value='right2')
# subr3=cast(SUBdata,StudioTestName~MediaName,value='right3')
# subr4=cast(SUBdata,StudioTestName~MediaName,value='right4')


# subdata1=SUBdata[1,];
# subdata2=SUBdata[1,];
# subdata3=SUBdata[1,];
# #subdata3=t(matrix(,15));
# #subname=SUBdata[1,]
# 
# 
# for (i in 2:2007)
#   if (SUBdata[i,5]=='test1')
#     subdata1= rbind(subdata1,SUBdata[i,])
# for (i in 2:2007)
#   if (SUBdata[i,5]=='test2')
#     subdata2= rbind(subdata2,SUBdata[i,])
# for (i in 2:2007)  
#   if (SUBdata[i,5]=='test3')
#     subdata3= rbind(subdata3,SUBdata[i,])
# 
# Rsubdata1=SUBdata[1,];
# Rsubdata2=SUBdata[1,];
# Rsubdata3=SUBdata[1,];
#     
# for (i in 2:730)
#   if (subdata1[i,4]=='fmy_block1')
#     Rsubdata1= rbind(Rsubdata1,SUBdata[i,])
# for (i in 2:2007)
#   if (SUBdata[i,4]=='fmy_block2')
#     Rsubdata2= rbind(Rsubdata2,SUBdata[i,])
# for (i in 2:2007)  
#   if (SUBdata[i,4]=='fmy_block3')
#     Rsubata3= rbind(Rsubdata3,SUBdata[i,])
#     