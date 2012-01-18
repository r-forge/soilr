setClass(# Model
   Class="Model",
   ### serves as a fence to the interface of SoilR functions. So that later implementations can differ	 
   representation=representation(
	times="numeric"
    ,
    mat="function"
    ,
    initialValues="numeric"
    ,
    inputrates="function"
    ,
    solverfunc="function"
   )
)
zerorate=function(t)
{
    return(0)
}
zeromat=function(t)
{
    return(matrix(nrow=1,ncol=1,1))
}
setMethod(
    f="initialize",
    signature="Model",
    definition=function(.Object,times=numeric(),mat=zeromat,initialValues=numeric(),inputrates=zerorate,solverfunc=deSolve.lsoda.wrapper){
        cat("-initializer at work-\n")
        .Object@times=times
        .Object@mat=mat
        .Object@initialValues=initialValues
        .Object@inputrates=inputrates
        .Object@solverfunc=solverfunc
        return(.Object)
    }
)
##defining Constructors
##The constructors are defined in seperate files which end with Model

setGeneric ( # This function 
   name= "getRelease",
   def=function(# access to the C content of the pools 
	object
	){standardGeneric("getRelease")}
)
setMethod(
   f= "getRelease",
      signature= "Model",
      definition=function(object){
      C=getC(object)
      A=object@mat
      n=length(object@initialValues)
      times=object@times
      rfunc=RespirationCoefficients(A)
      #rfunc is vector valued function of time 
      r=t(sapply(times,rfunc))
      R=r*C
      ### A matrix. Every column represents a pool and every row a point in time
      return(R)
   }
)
setGeneric ( # This function 
   name= "getC",
   def=function(# access to the C content of the pools 
	object
	){standardGeneric("getC")}
)
setMethod(
   f= "getC",
      signature= "Model",
      definition=function(object){
      ns=length(object@initialValues)
      ydot=NpYdot(object@mat,object@inputrates)
      sVmat=matrix(object@initialValues,nrow=ns,ncol=1)
      Y=solver(object@times,ydot,sVmat,object@solverfunc) 
      ### A matrix. Every column represents a pool and every row a point in time
      return(Y)
   }
)
setGeneric ( # This function 
   name= "getTimes",
   def=function(# access to the C content of the pools 
	object
	){standardGeneric("getTimes")}
)
setMethod(
   f= "getTimes",
      signature= "Model",
      definition=function(object){
      return(object@times)
   }
)

