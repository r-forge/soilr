mSpline=function(times,M){
require(parallel)
	lists=mapply(function(i){list(M[,i])},1:ncol(M)) #create a list of lists where every sublist contains a column of the matrix
	tsp=function(vec){splinefun(times,vec)}
	funs=mclapply(lists,tsp) #create a spline aproximation for every column
	ms=function(callerTimes){
		inject_t=function(fun){fun(callerTimes)}
		matrix(ncol=ncol(M),nrow=length(callerTimes),mapply(inject_t,funs)) #apply every function to a time argument and create a Matrix output (the callerTimes can be a vector)
	}
return(ms)
}

