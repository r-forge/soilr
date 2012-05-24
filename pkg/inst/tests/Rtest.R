#!/usr/bin/Rscript
source("prolog.R")
library("deSolve")
load("../../data/C14Atm_NH.rda")
#attr(GeneralModel_14,"ex")()
#Res=runTestFile("runit.test.Model.R")
#runTestFile("runit.manuell.Manzoni.TwopFeedback.R")
runTestFile("runit.automatic.Manzoni.op.R")
#runTestFile("runit.test.FEM.R")
#runTestFile("runit.test.checkSizes.R")
#printTextProtocol(Res)
#ef=getErrors(Res)
#n=ef$nErr+ef$nFail
#if (n>0) {stop(1)}
