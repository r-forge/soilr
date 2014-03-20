#!/usr/bin/Rscript
# vim:set ff=unix expandtab ts=2 sw=2:
source("prolog.R")
tfr  <- "^runit\\..*\\.R"
#fl <- list.files(pattern=tfr)
#for (fn in fl){
#  print(fn)
#  source(fn)
#}
alltests <- defineTestSuite(
   name="allTests",
   dirs=".",
   testFileRegexp = tfr,
   
   #testFuncRegexp = "^test.TwopSerial_linear_vs_nonlinear"
   #"^test.FourpSerial_1"
   #"test.TwopParallel_ZeroInput"
   #"^test.TwopFeedback"
   #"^test.TimeMapInterface"
   #"^test.LowVerticalRatesPaper" 
   #"^test.check.pass"
   #"ptest.ModelOperators"
   #"test.ParallelModel"
   #"test.TwopSerial_linear_vs_nonlinear"
   #"test.SoilRPaper1"
   "test.FourpSerial_1"
)

testResult <- runTestSuite(alltests)
printTextProtocol(testResult)
#produce exitstatus ne 0 for buildbot to notice
ef=getErrors(testResult)
n=ef$nErr+ef$nFail
if (n>0) {stop(1)}
