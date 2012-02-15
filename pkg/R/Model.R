setClass(
   Class="TimeMap",
   ### defines a (time dependent) mapping including the function definition and the ### domain where the function is well define.
### This can be used to avoid interpolations out of range when mixing different time dependent data sets
   representation=representation(
	starttime="numeric"
    ,
	endtime="numeric"
    ,
    map="function"
   )
)
setMethod(
    f="initialize",
    signature="TimeMap",
    definition=function(.Object,starttime=numeric(),endtime=numeric(),map=function(t){t}){
    #cat("-initializer at work-\n")
    .Object@starttime=starttime
    .Object@endtime=endtime
    .Object@map=map
    return(.Object)
    }
)
setGeneric(
    name="getTimeRange",
    def=function(object){
        standardGeneric("getTimeRange")
    }
)
setMethod(
    f="getTimeRange",
    signature="TimeMap",
    definition=function(object){
        return(
               c(object@starttime,object@endtime))
    }
)
setGeneric(
    name="getFunctionDefinition",
    def=function(object){
        standardGeneric("getFunctionDefinition")
    }
)
setMethod(
    f="getFunctionDefinition",
    signature="TimeMap",
    definition=function(object){
        return(object@map)
    }
)

TimeMap.new=function
### This function is the basic constructor of the class TimeMap.
(t_start, ##<<A number marking the begin of the time domain where the function is valid
 t_end,   ##<<A number the end of the time domain where the function is valid
 f        ##<<The time dependent function definition (a function in R's sense)
 ){
   obj=new(Class="TimeMap",t_start,t_end,f) 
return(obj)
### An object of class TimeMap that can be used to describe models.
}

TimeMap.from.Dataframe=function
### This function is the basic constructor of the class TimeMap.
(dframe, ##<<A data frame containing exactly two columns:
## the first one is interpreted as time
interpolation=splinefun ##<<A function that  returns a function  the default is splinefun. Other possible values are the linear interpolation approxfun or any self made function with the same interface.
 ){
   t=dframe[,1]  
   y=dframe[,2]  
   o=order(t)
   tyo=rbind(t[o],y[o])
   to=tyo[,1]
   yo=tyo[,2]
   t_start=min(to)
   interpol=splinefun(to,yo)
   t_start=min(t)
   t_end=max(t)
   interpol=interpolation(to,yo)
   obj=new(Class="TimeMap",t_start,t_end,interpol) 
return(obj)
### An object of class TimeMap that contains the interpolation function and the limits of the time range where the function is valid.
### this serves as a saveguard for Model which thus can check that all involved functions of time are actually defined for the times of interest  
}

TimeMap.from.Matrix=function
### This function is the basic constructor of the class TimeMap.
(mat ##<<A Matrix containing points in time and corresponding values
 ## the time is expected to be represented by the first column

 ){
    -
   obj=new(Class="TimeMap",t_start,t_end,f) 
return(obj)
### An object of class TimeMap that can be used to describe models.
}


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

