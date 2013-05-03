test.check.pass=function(){
	#source all the files in the R directory 
	prefix="../../R/"
	globstring=paste(prefix,"*.R",sep="")
	auto_paths=Sys.glob(globstring)
	for (p in auto_paths){
		source(p,local=TRUE)
	}
	#create a vector of all the function names
	X <- lsf.str()
	#create a helper that checks for the pass argument in the functions 
	#parameter list
	has_pass=function(x){"pass" %in% names(formals(x))}
	ind=as.vector(sapply(X,has_pass))
	print(ind)
	#extract the functions that have such an argument
	Xpass=X[ind]
	#now we check if there is a test that checks that the "pass" argument
	#To this end we define a caller that keeps book over the actually tested
	#functions a
	l=list()
	passCaller=function(previousCallers,actualCall){
		print("This is pass caller")
		print(sys.call(which=1))
		print(sys.function(which=1))
	}
	data(C14Atm_NH,HarvardForest14CO2)
	years=seq(1901,2010,by=0.5)
	cf=call("GaudinskiModel14",t=years,ks=c(kr=1/3,koi=1/1.5,koeal=1/4,koeah=1/80,kA1=1/3,kA2=1/75,kM=1/110),FcAtm=C14Atm_NH)
	passCaller(l,cf)
    

}
