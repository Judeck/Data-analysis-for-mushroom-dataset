
# BIG DATA GROUP PROJECT 2
# GROUP 8
# GROUP MEMBERS : wenyuan shao, kun chen ,yingwen liu

# Set the working directory
setwd("/Users/chenkun/Desktop/Gw/semester fall/big data/proj/2")

#load mushroom data set
rawdata <- read.table("agaricus-lepiota.data",sep=",")
rawdata <- rawdata[complete.cases(rawdata),]
rawmushroom <- as.data.frame(rawdata)
colnames(rawmushroom) <- c("EdibleOrPoisonous","capShape","capSurface","capColor","bruises","odor","gAttachment","gSpacing","gSize","gColor","stalkShape","stalkRoot","stalksurfAboveRing","stalksurfbelowRing","stalkColorAboveRing","stalkColorBelowRing","veilType","veilColor","ringNo","ringType","sporePrintcolor","population","habitat")
rawmushroom$veilType <-NULL
rawmushroom$stalkRoot <-NULL
rawmushroom <- rawmushroom[complete.cases(rawmushroom),]
# Convert characters in the data to respective numeric data
for (i in names(rawmushroom))
{
  rawmushroom[,i] <-as.numeric(rawmushroom[,i])
}
rw = c(1:16,18:23)
mr <- rawMushroomDF[rw]

library("MASS")

mr_related <- glm(class ~ cshape + bruises + odor + gattach + gspace + gcolor + sroot + scabove + scbelow + vcolor + rnumber + spcolor + popnum + habitat, data = mr)
# reduced the raw data by AIC
reducedRelation <- stepAIC(mr_related,direction = "both")
reducedRelation$anova
coefficients(reducedRelation)
summary(reducedRelation)
rw = c(1,2,5,6,7,8,10,12,15,16,17,18,20,21,22)
reduced_mr = mr[rw]

# Divide the reduced and normalized data into 60% training and 40% validation
set.seed(12345)
row=nrow(rawmushroom)
trainindex <- sample(nrow(rawmushroom),row*0.6 , replace=FALSE)
trainingdata60 <- rawmushroom[trainindex,]
testdata <- rawmushroom[-trainindex,]

# Usning STEP AIC to select the attributes by column number returned 
myvars = c(1,3,5:10,12:19,21)  
rawmushrfilter = rawmushroom[myvars]  

# Divide the reduced and normalized data into 70% training and 30% validation
set.seed(12345)
row=nrow(mushDF)
trainindex <- sample(nrow(mushDF),row*0.7 , replace=FALSE)
mushtrainingdata70 <- mushDF[trainindex,]
mushtestdata30 <- mushDF[-trainindex,]
# set different N with 3,5,7
length(which(x==1))
length(which(x==2))
length(which(x==3)) 

#heirarchical clustering 
library("vegan")
library("plyr")
mushdata <-  count(mushDF)
mushgrid <- vegdist(mushdata, method="jaccard")
mushcluster <- hclust(mushgrid, method="ward.D2")
plot(mushcluster,  labels = FALSE, hang = -1, main = "Original Tree")
cluster <- cutree(mushcluster, k = 7)
length(which(cluster==1))
length(which(cluster==2))
length(which(cluster==3)) 
length(which(cluster==4))
length(which(cluster==5))
length(which(cluster==6))
length(which(cluster==7))
central <- NULL
for(k in 1:7){
  central <- rbind(central, colMeans(mushdata[cluster == k, ,drop = FALSE]))
}
hc1 <- hclust(dist(central)^2, method = "cen", members = table(cluster))
plot(hc1,  labels = FALSE, hang = -1, main = "Heirarchical clustering")

# using pvclust to plot heirarchical clustering 
library(pvclust)
fit.h <- pvclust(mushDF, method.hclust="ward",method.dist="correlation")
plot(fit.h) 
pvrect(fit.h, alpha=.95) 


#KNN claasification
knndata <- rawmushrfilter[2:17]
KNN_DEC_VAR_DATA <- rawmushrfilter[1]
#normalize data
knndata_norm <- scale(knndata)

#divide into test and train 
set.seed(123456)
row=nrow(knndata_norm)
knntrainindex <- sample(nrow(knndata_norm),row*0.7 , replace=FALSE)
knntrain <- knndata_norm[knntrainindex,]
knntest <- knndata_norm[-knntrainindex,]
#use 70% training data.
set.seed(123456)
row=nrow(KNN_DEC_VAR_DATA)
knntrainlabelindex <- sample(nrow(KNN_DEC_VAR_DATA),row*0.7 , replace=FALSE)
knntrainLABEL <- KNN_DEC_VAR_DATA[knntrainlabelindex,]
knntestLABEL <- KNN_DEC_VAR_DATA[-knntrainlabelindex,]
library("class")
mush_test_pred <- knn(train=knntrain,test=knntest,cl=knntrainLABEL,k=7) 
library("gmodels")
CrossTable(x=knntestLABEL,y=mush_test_pred,prop.chisq=FALSE)

# Decision Trees
#select some attributes from 15 to make a decicsion tree
library(tree)
set.seed(121)
decisdata <- tree(rawmushrfilter$EdibleOrPoisonous~rawmushrfilter$odor+ rawmushrfilter$capSurface+rawmushrfilter$gSize+rawmushrfilter$capSurface+rawmushrfilter$bruises+rawmushrfilter$gAttachment+rawmushrfilter$gSpacing+rawmushrfilter$gColor+rawmushrfilter$stalksurfAboveRing)
plot(decisdata)
title(main="Decision tree")
text(decisdata)


