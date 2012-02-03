#!/usr/bin/Rscript
library("RUnit")
prefix="../../R/"
globstring=paste(prefix,"*.R",sep="")
files=Sys.glob(globstring)
print(files)
fnames=c(
#           "Model.R",
#           "GeneralModel.R",
#           "deSolve.lsoda.Wrapper.R",
#           "correctnessOfModel.R",
#           "RespirationCoefficients.R",
#           "NpYdot.R",
#           "solver.R"
          )
filenames=sapply(fnames,function(x){paste(prefix,x,sep="")})
filelist=c(filenames,files)
print(filelist)
sapply(filelist,source,echo=FALSE)
