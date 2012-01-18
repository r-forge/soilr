#!/usr/bin/Rscript
library("RUnit")
filelist=Sys.glob("../../R/*.R")
cat(filelist)
sapply(filelist,source)

alltests <- defineTestSuite(
   name="allTests",
   #dirs = file.path(.path.package(package="SoilR"),
   #"tests"),
   dirs=".",
   testFileRegexp = "^runit.+\\.[rR]",
   testFuncRegexp = "^test.+",
   rngKind = "Marsaglia-Multicarry",
   rngNormalKind = "Kinderman-Ramage"
)

testResult <- runTestSuite(alltests)
printTextProtocol(testResult)

