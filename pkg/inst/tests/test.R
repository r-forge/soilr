#!/usr/bin/Rscript
source("prolog.R")
library("deSolve")
#attr(OnepModel,"ex")()
#attr(TwopParallelModel,"ex")()
Res=runTestFile("runit.test.Model.R")
#runTestFile("runit.test.automatic.TwopParallel.R")
printTextProtocol(Res)
ef=getErrors(Res)
n=ef$nErr+ef$nFail
if (n>0) {stop(1)}
