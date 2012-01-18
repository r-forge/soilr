library("RUnit")
library("SoilR")
alltests <- defineTestSuite(
   name="allTests",
   dirs = file.path(.path.package(package="SoilR"),
   "tests"),
   testFileRegexp = "^runit.+\\.[rR]",
   testFuncRegexp = "^test.+",
   rngKind = "Marsaglia-Multicarry",
   rngNormalKind = "Kinderman-Ramage"
)

testResult <- runTestSuite(alltests)
printTextProtocol(testResult)

