# do not change change this file 
# it was produced automatically by 
# ./buildandRun.sh
print("dyn.load:")
dyn.load(paste("~/SoilR/RPackages/SoilR/C++/MCMC/MCS", .Platform$dynlib.ext, sep = ""))
print(".C")
val=.Call("X_main",par=list(nt=20,f=as.double(30.3)),vec=1:20)
print(val)
