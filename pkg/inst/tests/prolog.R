#!/usr/bin/Rscript
library("RUnit")
prefix="../../R/"
globstring=paste(prefix,"*.R",sep="")
auto_paths=Sys.glob(globstring)
#print(auto_paths)
preload_auto_paths=c(
           "1_TimeMap.R",
           "Model.R",
           "Model_14.R",
           "DecompositionOperator.R",
           "GeneralModel14.R"
          )
preload_paths=sapply(preload_auto_paths,function(x){return(paste(prefix,x,sep=""))})
#print(preload_paths)
all_paths=c(preload_paths,auto_paths)
#print(all_paths)

for (f in all_paths){
    print(f)
    source(f,echo=FALSE)
}
