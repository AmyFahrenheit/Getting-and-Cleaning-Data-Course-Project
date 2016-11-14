##Setting Local Working Directory:
## (PLEASE NOTE: That's where I cloned the GitHub repository to on MY local computer!)
setwd("D:/JHSPH Academics/Coursera/Course 3_Getting and Cleaning Data/Week 4/Getting-and-Cleaning-Data")

##Reading and Combining Files after Downloading and Unzipping, and Creating New Variable "ID" for Merging:
SUBTEST=read.table("subject_test.txt")
SUBTRAIN=read.table("subject_train.txt")
SUB=rbind(SUBTEST,SUBTRAIN)
SUB$ID=seq.int(nrow(SUB))

LABTEST=read.table("y_test.txt")
LABTRAIN=read.table("y_train.txt")
LAB=rbind(LABTEST,LABTRAIN)
LAB$ID=seq.int(nrow(LAB))

SETTEST=read.table("X_test.txt")
SETTRAIN=read.table("X_train.txt")
SET=rbind(SETTEST,SETTRAIN)
SET$ID=seq.int(nrow(SET))

##Reading the File "Features" and Transposing It:
FEATURES=read.table("features.txt")
TPF=t(FEATURES)
TPF=data.frame(TPF)

##Merging Combined Files:
SUBLAB=merge(SUB,LAB,by="ID")
SLS=merge(SUBLAB,SET,by="ID")

FEATURENAMES=TPF[2,]
FNAMES=unlist(FEATURENAMES)
FNAMES=as.character(FNAMES)

##Setting Variable Names for the New Total Dataframe:
TOTALNAMES=c("ID","SUBJECTS","ACTIVITIES",FNAMES)
colnames(SLS) <- TOTALNAMES

##Extracting Measurements for only Mean and Standard Deviation:
EXTR=SLS[ , grepl("ID|SUBJECTS|ACTIVITIES|std|Mean|mean",names(SLS))]

##Renaming Activities in the Dataset:
EXTR1=EXTR
EXTR1$ACTIVITIES[EXTR1$ACTIVITIES==1] = "WALKING"
EXTR1$ACTIVITIES[EXTR1$ACTIVITIES==2] = "WALKING_UPSTAIRS"
EXTR1$ACTIVITIES[EXTR1$ACTIVITIES==3] = "WALKING_DOWNSTAIRS"
EXTR1$ACTIVITIES[EXTR1$ACTIVITIES==4] = "SITTING"
EXTR1$ACTIVITIES[EXTR1$ACTIVITIES==5] = "STANDING"
EXTR1$ACTIVITIES[EXTR1$ACTIVITIES==6] = "LAYING"

##Creating New Dataset with Average of Each Variable, for Each Subject/Activity:
EXTR2 <- EXTR1[0, ]
EXTR2[1,1]=1
EXTR2[1,2]=0
EXTR2[1,3]=0
for (j in 4:89) {
  EXTR2[1,j]=EXTR1[1,j]
}

for (i in 2:10298) {
  if(EXTR1[i,2]==EXTR1[i+1,2] && EXTR1[i,3]==EXTR1[i+1,3]) {
    EXTR2[i,2]=0
    EXTR2[i,3]=0
    if(EXTR1[i,2]==EXTR1[i-1,2] && EXTR1[i,3]==EXTR1[i-1,3]) {
      EXTR2[i,1]=EXTR2[i-1,1]+1
      for (j in 4:89) {
        EXTR2[i,j]=EXTR2[i-1,j]+EXTR1[i,j]
      }
    } else {
      EXTR2[i,1]=1
      for (j in 4:89) {
        EXTR2[i,j]=EXTR1[i,j]
      }
    }
  }
  if (EXTR1[i,2]!=EXTR1[i+1,2] || EXTR1[i,3]!=EXTR1[i+1,3]) {
    EXTR2[i,1]=EXTR2[i-1,1]+1
    EXTR2[i,2]=EXTR1[i,2]
    EXTR2[i,3]=EXTR1[i,3]
    for (j in 4:89) {
      EXTR2[i,j]=(EXTR2[i-1,j]+EXTR1[i,j])/EXTR2[i,1]
    }
  }
}

EXTR2[10299,1]=EXTR2[10298,1]+1
EXTR2[10299,2]=EXTR1[10299,2]
EXTR2[10299,3]=EXTR1[10299,3]
for (j in 4:89) {
  EXTR2[10299,j]=(EXTR2[10298,j]+EXTR1[10299,j])/EXTR2[10299,1]
}

##Deleting Extra Rows from the Second Dataset, and Resetting ID:
EXTR2 <- EXTR2[!(EXTR2$SUBJECTS==0 & EXTR2$ACTIVITIES==0), ]
EXTR2$ID=seq.int(nrow(EXTR2))

##"Switching Off" Row Names:
row.names(EXTR2) <- NULL

##Exporting the New Dataset as CSV File:
write.csv(EXTR2, file = "run_analysis.csv")

##Thank You for the Review!!!


