setClass(# Model
   Class="Model",
   ### serves as a fence to the interface of SoilR functions. So that later implementations can differ	 
   representation=representation(
	times="numeric"
    ,
    mat="TimeMap"
    ,
    initialValues="numeric"
    ,
    inputFluxes="TimeMap"
    ,
    solverfunc="function"
   )
)
zerorate=function(t)
{
    return(0)
}
zeromat=TimeMap.new(
    0,
    0,
    function(t){
        return(matrix(nrow=1,ncol=1,1))
    }
) 
setMethod(
    f="initialize",
    signature="Model",
    definition=function(.Object,times=numeric(),mat=zeromat,initialValues=numeric(),inputFluxes=zerorate,solverfunc=deSolve.lsoda.wrapper){
        cat("-initializer at work-\n")
        .Object@times=times
        .Object@mat=mat
        .Object@initialValues=initialValues
        .Object@inputFluxes=inputFluxes
        .Object@solverfunc=solverfunc
        return(.Object)
    }
)
##defining Constructors
##The constructors are defined in seperate files which end with Model

setGeneric ( # This function 
   name= "getReleaseFlux",
   def=function(# access to the C content of the pools 
	object
	){standardGeneric("getReleaseFlux")}
)
setGeneric ( # This function 
   name= "getRelease",
   def=function(# access to the C content of the pools 
	object
	){standardGeneric("getRelease")}
)
setMethod(
   f= "getReleaseFlux",
      signature= "Model",
      definition=function(object){
      C=getC(object)
      times=object@times
      Atm=object@mat
      A=getFunction(Atm)
      n=length(object@initialValues)
      rfunc=RespirationCoefficients(A)
      #rfunc is vector valued function of time
      r=t(sapply(times,rfunc))
      R=r*C
      ### A matrix. Every column represents a pool and every row a point in time
      return(R)
   }
)
setMethod(
   f= "getRelease",
      # This function integrates the release Flux over time
      signature= "Model",
      definition=function(object){
      times=object@times
      R=getReleaseFlux(object)
      n=ncol(R)
      #transform the array to a list of functions of time by
      #intepolating it with splines
      Rfuns=list(splinefun(times,R[,1]))
      for (i in 2:n){
          Rf=splinefun(times,R[,i])
          Rfuns=append(Rfuns,Rf)
      }
      #test=Rfuns[[1]]
      #now we can construct the derivative of the respiration as function of time
      #as needed by the ode solver
      rdot=function(y,t0){
           # the simples possible case for an ode solver is that the ode is
           # just an integral and does not depend on the value but only on t
           # This is the case here
           rv=matrix(nrow=n,ncol=1)
           for (i in 1:n){
               #print(Rfuns[i])
               rv[i,1]=Rfuns[[i]](t0)
           }
           return(rv)
      }
      sVmat=matrix(0,nrow=n,ncol=1)
      Y=solver(object@times,rdot,sVmat,object@solverfunc)
      #### A matrix. Every column represents a pool and every row a point in time
      return(Y)
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
      Atm=object@mat
      #print(Atm)
      A=getFunction(Atm)
      #print(A)
      itm=object@inputFluxes
      input=getFunction(itm)
      #print(input)
      ydot=NpYdot(A,input)
      #print(ydot)
      sVmat=matrix(object@initialValues,nrow=ns,ncol=1)
      Y=solver(object@times,ydot,sVmat,object@solverfunc) 
      #print(Y)
      ### A matrix. Every column represents a pool and every row a point in time
      return(Y)
   }
)
setGeneric ( # This function 
   name= "getTimes",
   def=function(# access to the time values the model solution is sougth for 
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

