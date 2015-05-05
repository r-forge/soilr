#!/bin/bash
sources="X_main.cpp X.cpp"
libname=X_main
echo libname=${libname}
echo sources=${sources}
R CMD SHLIB ${sources}
rscript=${0%.sh}.R
cat >${rscript} <<InputComesFromHERE
# do not change change this file 
# it was produced automatically by 
# $0
print("dyn.load:")
dyn.load(paste("~/SoilR/RPackages/SoilR/C++/MCMC/R/${libname}", .Platform\$dynlib.ext, sep = ""))
print(".C")
.C("X_main")
InputComesFromHERE
/usr/bin/Rscript ${rscript}
