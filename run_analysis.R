#
# This script is for the Class Project for the Getting and Cleaning Data 
# course in the Coursera Data Scientist track
#
# This script should be run from the "UCI HAR Dataset" directory after
# the data file is unzipped
#
#
# First load the dplyr library for use in the summarize_each step at the end
#  
library(dplyr);
#
# Next load the features file in as a table.  This will give us our column names 
# later
# 
fea<-read.table("./features.txt");
# 
# Load in the rows for the training data set and assign the column names
#
XTrain<-read.table("./train/X_train.txt");
colnames(XTrain)<-fea[,2];
#
# Now load in the Activity numerical values, these will be decoded later
#
YTrain<-read.table("./train/y_train.txt");
colnames(YTrain)<-c("Activity");
TrainXY<-data.frame(YTrain,XTrain);
#
# Now load in the subject ids
#
XTrainSub<-read.table("./train/subject_train.txt");
colnames(XTrainSub)<-("Subject");
TrainXY<-data.frame(XTrainSub,TrainXY);
#
# Repeat the steps above for the Test data
#
XTest<-read.table("./test/X_test.txt");
colnames(XTest)<-fea[,2];              
YTest<-read.table("./test/y_test.txt");                
colnames(YTest)<-c("Activity");
TestXY<-data.frame(YTest,XTest);
XTestSub<-read.table("./test/subject_test.txt");
colnames(XTestSub)<-c("Subject");
TestXY<-data.frame(XTestSub,TestXY);
#
# Join the Test and Train data frames together
#
MTestTrain<-rbind(TestXY,TrainXY);
#
# Create a new data frame that contains only the Subject, Activity columns 
# along with any columns that get a mean or std
#
MTStep2<-MTestTrain[(grep(("Subject|mean|std|Activity"),colnames(MTestTrain)))];
#
# Remove the meanFreq columns
#
MTStep2b<-MTStep2[(-grep(("Freq"),colnames(MTStep2)))];
#
# Replace the numeric Activity labels with descriptive labels
#
alabels<-read.table("./activity_labels.txt");
MTStep3Labels<-as.data.frame(alabels[MTStep2b$Activity,2]);
MTStep3<-MTStep2b[(-grep(("Activity"),colnames(MTStep2b)))];
colnames(MTStep3Labels)<-c("Activity");
MTStep4<-data.frame(MTStep3Labels,MTStep3);
#
# Group the data frame by the Subject and Activity, then
# get an average for each measurement column for each 
# Subject/Activity combination
#
MTStep5<-group_by(MTStep4,Subject, Activity);
MTStep5a<-summarize_each(MTStep5,funs(mean),3:68);
