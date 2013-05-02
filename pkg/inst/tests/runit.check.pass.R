test.check.pass=function(){
	#source all the files in the R directory 
	prefix="../../R/"
	globstring=paste(prefix,"*.R",sep="")
	auto_paths=Sys.glob(globstring)
	sapply(auto_paths,source)
	#create a vector of all the function names
	X <- lsf.str()
	#create a helper that checks for the pass argument in the functions 
	#parameter list
	has_pass=function(x){"pass" %in% names(formals(x))}
	ind=sapply(X,has_pass)
	#extract the functions that have such an argument
	Xpass=X[ind]
	#now these functions must be tested if the honor pass

}
