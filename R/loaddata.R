library(xlsx)
library(dplyr)

immClasses <- c(
    "character"
    ,"character"
    ,"character"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
)

immData <- read.xlsx2(
    file = ".//data//base//Primary Health Network Report_30.09.15.xlsx"
    ,sheetName = "Primary Health Network Report"
    ,startRow = 6
    ,endRow = 102
    ,colClasses = immClasses
)

colClean <- function(x){
    colnames(x) <- gsub("\\.+", "_", colnames(x));
    colnames(x) <- gsub("X_", "PCT_", colnames(x));
    x 
}


immData <- colClean(immData)

lapply(immData, class)
names(immData)
unique(immData$Age_Group)

immData$Age_Group = factor(
    immData$Age_Group
    ,levels = c(
        "12-<15 Months"
        ,"24-<27 Months"
        ,"60-<63 Months"
        )
    ,ordered=TRUE
)


immData$Time_Period <- mutate(immData, Time_Period = "20150930")
