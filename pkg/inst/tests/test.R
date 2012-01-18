#!/usr/bin/Rscript
library(RUnit)
filelist=Sys.glob("../../R/*.R")
cat(filelist)
sapply(filelist,source,echo=FALSE)
runTestFile("runit.test.TimeMap.R")
#runTestFile("runit.test.automatic.TwopParallel.R")
