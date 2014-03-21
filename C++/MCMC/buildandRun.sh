#!/bin/bash
sources="PseudoR.cpp"
libname="MCS"
rm ${libname}.so
echo libname=${libname}
echo sources=${sources}
export  PKG_LIBS=$(Rscript -e "Rcpp:::LdFlags()")
export  PKG_CXXFLAGS=$(Rscript -e "Rcpp:::CxxFlags()")
R CMD SHLIB ${sources} -o ${libname}.so
#R CMD SHLIB ${sources} 

#res<- fx(seq(1,10,by=1))
rscript=${0%.sh}.R
cat >${rscript} <<InputComesFromHERE
# do not change change this file 
# it was produced automatically by 
# $0
print("dyn.load:")
dyn.load(paste("~/SoilR/RPackages/SoilR/C++/MCMC/${libname}", .Platform\$dynlib.ext, sep = ""))
print(".C")
val=.Call("X_main",par=list(nt=20,f=as.double(30.3)),vec=1:20)
print(val)
InputComesFromHERE
/usr/bin/Rscript ${rscript}
