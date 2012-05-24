deSolve.lsoda.wrapper=function(
### The function serves as a wrapper for lsoda using a much simpler interface which allows the use 
### of matrices in the definition of the derivative. 
### To use lsoda we have to convert our vectors to lists, define tolerances and so on.
### This function does this for us , so we don't need to bother about it.
	       t,	##<< A row vector containing the points in time where the solution is sought.
	       ydot,    ##<< The function of y and t that computes the derivative for a given 
	       ## point in time and a column vector y.
	       startValues ##<< A column vector with the starting values.
	       ){
   
   parms=NULL
   my.atol <- 1e-6
   rtol=1e-4
   lsexamp <- function(t, y,parms)
     {
	yv=cbind(y)
	YD=ydot(y,t)
	yd=as.vector(YD)
       #list(yd,c(massbalance=sum(y))) we could add other output parameter if we are interested
       list(yd)
     }
   require(deSolve)
   out <- lsoda(startValues,t,lsexamp, parms, rtol, atol= my.atol)
      #print(paste("out=",out))
      #print(out)
   # The output of lsoda is unsuiteable for our needs for two reasons
   # 1.) It also returns the time vector in column 1 
   # 2.) the columns get names instead of the default numbers created
   #     by the matrix function
   # we threrefore extract the information and store it in a new matrix witch will be t 
   n=length(startValues)
   if (n==1) { Yt=matrix(ncol=n,out[,-1])}
   else {Yt=out[,-1]}
   #print("Yt=")
   #print(Yt)
   #determine the number of pools 
   #determine the number of time values for which the solution is sought
   tn=length(t) 
   Y=matrix(ncol=n,nrow=length(t))
   #print(Yt[,1])
   for (i in 1:n){
      #print(paste("i=",i))
      Y[,i]=Yt[,i]
   }
   return(Y)
   ### A matrix. Every column represents a pool and every row a point in time
}


   ### serves as a fence to the interface of SoilR functions. So that later implementations can differ	 
setClass(# Model
   Class="Model",
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

setMethod(
    f="initialize",
    signature="Model",
    definition=function(
        .Object,times=numeric()
        ,
        mat=TimeMap.new(
                0,
                0,
                function(t){
                    return(matrix(nrow=1,ncol=1,1))
                }
        ) 
        ,
        initialValues=numeric()
        ,
        inputFluxes= TimeMap.new(
            0,
            0,
            function(t){
                return(matrix(nrow=1,ncol=1,1))
            }
        )
        ,
        solverfunc=deSolve.lsoda.wrapper
        ){
       # cat("-initializer at work-\n")
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
   name= "getTimes",
   def=function(# access to the time values the model solution is sougth for 
    ### This functions extracts the times argument
	object
	){standardGeneric("getTimes")}
)
setMethod(
   f= "getTimes",
      signature= "Model",
      definition=function(object){
      ### This functions extracts the times argument from an argument of class Model
      return(object@times)
   }
)
setGeneric ( # This function 
   name= "getC",
   def=function(# access to the C content of the pools 
    ### This function computes the value for C (mass or concentration ) as function of time
	object
	){standardGeneric("getC")}
)
setMethod(
   f= "getC",
      signature= "Model",
      definition=function(object){
      ### This function computes the value for C (mass or concentration ) as function of time
      ns=length(object@initialValues)
      Atm=object@mat
      #print(Atm)
      A=getFunctionDefinition(Atm)
      #print(A)
      itm=object@inputFluxes
      input=getFunctionDefinition(itm)
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
   name= "getReleaseFlux",
   def=function(# access to the C content of the pools 
   ### This function computes the overall  carbon release of the given model as funtion of time 
	object
	){standardGeneric("getReleaseFlux")}
)
setMethod(
   f= "getReleaseFlux",
      signature= "Model",
      definition=function(object){
      C=getC(object)
      #print("dim(C)=")
      #print(dim(C))
      times=object@times
      Atm=object@mat
      A=getFunctionDefinition(Atm)
      n=length(object@initialValues)
      #print(n)
      rfunc=RespirationCoefficients(A)
      #rfunc is vector valued function of time
      if (n==1) { r=matrix(ncol=n,sapply(times,rfunc))}
      else {r=t(sapply(times,rfunc))}
      #print("dim(r)=")
      #print(dim(r))
      R=r*C
      ### A matrix. Every column represents a pool and every row a point in time
      return(R)
   }
)
setGeneric ( # This function 
   name= "getAccumulatedRelease",
   def=function(# access to the C content of the pools 
   ### This function computes the overall  carbon release of the given model as funtion of time 
	object
	){standardGeneric("getAccumulatedRelease")}
)
setMethod(
   f= "getAccumulatedRelease",
      signature= "Model",
      definition=function(object){
      ### This function integrates the release Flux over time
      times=object@times
      R=getReleaseFlux(object)
      n=ncol(R)
      #transform the array to a list of functions of time by
      #intepolating it with splines
      if (n==1) {
          Rfuns=list(splinefun(times,R))
      }
      else{
        Rfuns=list(splinefun(times,R[,1]))
        for (i in 2:n){
            Rf=splinefun(times,R[,i])
            Rfuns=append(Rfuns,Rf)
        }
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
##########################################################
