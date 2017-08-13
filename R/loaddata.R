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

colClean <- function(x){
    colnames(x) <- gsub("\\.+", "_", colnames(x));
    colnames(x) <- gsub("X_", "PCT_", colnames(x));
    colnames(x) <- gsub("_$", "", colnames(x));
    x 
}

ageFactors <- function(x){
    x <- factor(
        x
        ,levels = c(
            "12-<15 Months"
            ,"24-<27 Months"
            ,"60-<63 Months"
        )
        ,ordered=TRUE
    );
    x
}


immData <- read.xlsx2(
    file = ".//data//base//Primary Health Network Report_30.09.15.xlsx"
    ,sheetName = "Primary Health Network Report"
    ,startRow = 6
    ,endRow = 102
    ,colClasses = immClasses
)



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


immData <- mutate(immData, Time_Period = as.Date("2015-06-30"))

save(immData,file = ".\\data\\processed\\immData.Rda")

immDataAll <- immData
save(immDataAll, file = ".\\data\\processed\\immDataAll.Rda")

##### xAll-PHN-Report-Dec15.xlsx

immData <- read.xlsx2(
    file = ".//data//base//xAll-PHN-Report-Dec15.xlsx"
    ,sheetName = "Primary Health Network Report"
    ,startRow = 6
    ,endRow = 102
    ,colClasses = immClasses
)
immData <- colClean(immData)
immData$Age_Group = factor(
    immData$Age_Group
    ,levels = c(
        "12-<15 Months"
        ,"24-<27 Months"
        ,"60-<63 Months"
    )
    ,ordered=TRUE
)
immData <- mutate(immData, Time_Period = as.Date("2015-09-30"))


immDataAll <- bind_rows(immDataAll, immData)
save(immDataAll, file = ".\\data\\processed\\immDataAll.Rda")


##### xPHN-March-2016.xlsx
immData <- read.xlsx2(
    file = ".//data//base//xPHN-March-2016.xlsx"
    ,sheetName = "Primary Health Network Report"
    ,startRow = 5
    ,endRow = 101
    ,colClasses = immClasses
)
immData <- colClean(immData)
immData$Age_Group <- ageFactors(immData$Age_Group)
immData <- mutate(immData, Time_Period = as.Date("2015-12-31"))

immDataAll <- bind_rows(immDataAll, immData)
save(immDataAll, file = ".\\data\\processed\\immDataAll.Rda")


##### xPHN-June-2016
immData <- read.xlsx2(
    file = ".//data//base//xPHN-June-2016.xlsx"
    ,sheetName = "Primary Health Network Report"
    ,startRow = 6
    ,endRow = 102
    ,colClasses = immClasses
)
immData <- colClean(immData)
immData$Age_Group <- ageFactors(immData$Age_Group)
immData <- mutate(immData, Time_Period = as.Date("2016-03-31"))

immDataAll <- bind_rows(immDataAll, immData)
save(immDataAll, file = ".\\data\\processed\\immDataAll.Rda")


##### xPHN-Sept-2016
immData <- read.xlsx2(
    file = ".//data//base//xPHN-Sept-2016.xlsx"
    ,sheetName = "Primary Health Network Report"
    ,startRow = 5
    ,endRow = 101
    ,colClasses = immClasses
)
immData <- colClean(immData)
immData$Age_Group <- ageFactors(immData$Age_Group)
immData <- mutate(immData, Time_Period = as.Date("2016-06-30"))

immDataAll <- bind_rows(immDataAll, immData)
save(immDataAll, file = ".\\data\\processed\\immDataAll.Rda")

####### xAll-PHN-Dec2016
immData <- read.xlsx2(
    file = ".//data//base//xAll-PHN-Dec2016.xlsx"
    ,sheetName = "Primary Health Network Report"
    ,startRow = 6
    ,endRow = 102
    ,colClasses = immClasses
)
immData <- colClean(immData)
immData$Age_Group <- ageFactors(immData$Age_Group)
immData <- mutate(immData, Time_Period = as.Date("2016-09-30"))

immDataAll <- bind_rows(immDataAll, immData)
save(immDataAll, file = ".\\data\\processed\\immDataAll.Rda")


####### xAll-PHN_March-2017
immData <- read.xlsx2(
    file = ".//data//base//xAll-PHN_March-2017.xlsx"
    ,sheetName = "Primary Health Network Report"
    ,startRow = 6
    ,endRow = 102
    ,colClasses = immClasses
)
immData <- colClean(immData)
immData$Age_Group <- ageFactors(immData$Age_Group)
immData <- mutate(immData, Time_Period = as.Date("2016-12-31"))

immDataAll <- bind_rows(immDataAll, immData)
save(immDataAll, file = ".\\data\\processed\\immDataAll.Rda")
