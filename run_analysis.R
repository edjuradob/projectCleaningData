
stringAsFactors = FALSE

#Read all files and asing them to symbols

xtrain<-read.table("UCI HAR Dataset/train/x_train.txt")
ylabels<-read.table("UCI HAR Dataset/train/y_train.txt")
subject<-read.table("UCI HAR Dataset/train/subject_train.txt")
activities<-read.table("UCI HAR Dataset/activity_labels.txt")

xtraint<-read.table("UCI HAR Dataset/test/x_test.txt")
ylabelst<-read.table("UCI HAR Dataset/test/y_test.txt")
subjectt<-read.table("UCI HAR Dataset/test/subject_test.txt")

features<-read.table("UCI HAR Dataset/features.txt")

#adding activity columns to datasets
dat_train<-cbind(ylabels,xtrain)
dat_test<-cbind(ylabelst,xtraint)

#adding subject column
dat_train<-cbind(subject,dat_train)
dat_test<-cbind(subjectt,dat_test)

#put all toguether
testAndTrainData<-rbind(dat_train,dat_test)


#naming the columns
names(testAndTrainData)[1]<-"subject"
names(testAndTrainData)[2]<-"activity"
names(testAndTrainData)[3:563]<-as.vector(t(features[[2]]))

#change labels for activity names
factors<-factor(testAndTrainData$activity)
levels(factors)<-activities[[2]]
testAndTrainData$activity<-factors

#filtering mean and standar deviation columns
filters<-testAndTrainData
for (i in 1:length(names(filters))){
  names(filters)[i]<-gsub("meanFreq|gravityMean|tBodyAccMean,|tBodyAccJerkMean|tBodyGyroMean,|tBodyGyroJerkMean","delete",names(filters)[i])
}

meanStdIndices<-grep("activity|subject|[Mm]ean|[Ss]td",names(filters))
meanStdData<-filters[,meanStdIndices]

#Renaming columns
for (i in 1:length(names(meanStdData))){
  names(meanStdData)[i]<-gsub("-","_",names(meanStdData)[i])
  names(meanStdData)[i]<-gsub("[()]","",names(meanStdData)[i])
  names(meanStdData)[i]<-tolower(gsub(",","_",names(meanStdData)[i]))
}


write.table(meanStdData,"tidyData.txt", row.names=FALSE)







dat1<-data.frame(dat_train,row.names=as.vector(t(c("features",features[[2]]))))


dat<-cbind(matrix(features[[2]]),matrix(xtrain))
dat<-rbind(t(features[[2]]),xtrain)
dat<-rbind(c("Features",t(matrix(subject))),dat)


datt<-rbind(t(matrix(subjectt)),matrix(xtraint))
alldata<-cbind(dat,datt)