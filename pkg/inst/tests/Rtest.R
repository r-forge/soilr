#!/usr/bin/Rscript
source("prolog.R")
#attr(GeneralModel_14,"ex")()
#Res=runTestFile("runit.test.FcAtm.R")
Res=runTestFile("runit.test.Conversion.R")
#Res=runTestFile("runit.test.Model.R")
#Res=runTestFile("runit.test.Model_14.R")
#Res=runTestFile("runit.manuell.Manzoni.TwopFeedback.R")
#Res=runTestFile("runit.automatic.Manzoni.op.R")
#Res=runTestFile("runit.test.FEM.R")
#Res=runTestFile("runit.test.checkSizes.R")
#Res=runTestFile("runit.test.manual.help.R")
#Res=runTestFile("runit.test.manual.index.R")
#Res=runTestFile("runit.test.Conversion.R")
printTextProtocol(Res)
ef=getErrors(Res)
n=ef$nErr+ef$nFail
if (n>0) {stop(1)}
