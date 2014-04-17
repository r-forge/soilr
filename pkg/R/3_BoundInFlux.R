#
# vim:set ff=unix expandtab ts=2 sw=2:
BoundInFlux.new=function#basic constructor of the class BoundInFlux.
### A BoundInFlux is nothing more than an usual R-function of one argument augmented by the lower and upper boundary of the interval where it is defined.
(t_start, ##<<A number marking the begin of the time domain where the function is valid
 t_end,   ##<<A number the end of the time domain where the function is valid
 f        ##<<The time dependent function definition (a function in R's sense)
 ){
   obj=new(Class="BoundInFlux",t_start,t_end,f) 
return(obj)
### An object of class BoundInFlux that can be used to describe models.
}
##########################################################################

### defines a time dependent inputrate as function of time and 
### including the domain where the function is well defined.  
### This can be used to avoid interpolations out of range when mixing different time dependent data sets
setClass(
   Class="BoundInFlux",
   contains="InFlux",
   slots=list(
	starttime="numeric"
    ,
	endtime="numeric"
    ,
    map="function"
    ,
    lag="numeric"
   )
)
setMethod(
    f="initialize",
    signature="BoundInFlux",
    definition=function(.Object,starttime=numeric(),endtime=numeric(),map=function(t){t},lag=0){
    #cat("-initializer at work-\n")
    .Object@starttime=starttime
    .Object@endtime=endtime
    .Object@map=map
    .Object@lag=lag
    return(.Object)
    }
)
setMethod(
    f="as.character",
    signature="BoundInFlux",
    definition=function # convert BoundInFlux Objects to something printable.
    (x, ##<< An object of class BoundInFlux
     ...
     ){
        return(
            paste( class(x),
                  "(\n starttime=",
                  x@starttime,
                  "\n endtime=",
                  x@endtime,
                  ")",
                  sep=""
            )
        )
    }
)    
setMethod(
    f="getTimeRange",
    signature="BoundInFlux",
    definition=function(object){
        return(
               c("t_min"=object@starttime,"t_max"=object@endtime))
    }
)
setMethod(
    f="getFunctionDefinition",
    signature="BoundInFlux",
    definition=function(object){
    ### extract the function definition (the R-function) from the BoundInFlux 
        return(object@map)
    }
)

#BoundInFlux.from.Dataframe=function
#### This function is another constructor of the class BoundInFlux.
#(dframe, ##<<A data frame containing exactly two columns:
### the first one is interpreted as time
#lag=0, ##<< a scalar describing the time lag. Positive Values shift the argument of the interpolation function forward in time. (retard its effect)
#interpolation=splinefun ##<<A function that  returns a function  the default is splinefun. Other possible values are the linear interpolation approxfun or any self made function with the same interface.
# ){
#   t=dframe[,1]  
#   y=dframe[,2]  
#   o=order(t)
#   tyo=cbind(t[o],y[o])
#   to=tyo[,1]+lag# account for the lag time
#   yo=tyo[,2]
#   t_start=min(to)
#   t_start=min(t)
#   t_end=max(t)
#   interpol=interpolation(to,yo)
#   obj=new(Class="BoundInFlux",map=interpol,t_start,t_end,lag) 
#return(obj)
#### An object of class BoundInFlux that contains the interpolation function and the limits of the time range where the function is valid. Note that the limits change according to the time lag
#### this serves as a saveguard for Model which thus can check that all involved functions of time are actually defined for the times of interest  
#}
setMethod(
  f="BoundInFlux",
  signature=c(
    map="function",
    starttime="numeric",
    endtime="numeric",
    lag="numeric",
    interpolation="missing"
  ),
  definition=function # costructor 
  ### the method constructs a Temporary Input Flux from its basic ingredients
  (
    map,
    starttime,
    endtime,
    lag
    ){
    new("BoundInFlux",map=map,starttime=starttime,endtime=endtime,lag=lag)
  }
)
setMethod(
  f="BoundInFlux",
  signature=c(map="function",starttime="numeric",endtime="numeric",lag="missing",interpolation="missing"),
  definition=function # costructor 
  ### the method constructs a Temporary Input Flux from its basic ingredients
  (map,starttime,endtime){
    BoundInFlux(map=map,starttime=starttime,endtime=endtime,lag=0)
  }
)
setMethod(
  f="BoundInFlux",
  signature=c(map="data.frame",starttime="missing",endtime="missing",lag="numeric",interpolation="function"),
  definition=function #constructor
  ### This function is another constructor of the class BoundInFlux.
  (
    map ,##<<A data frame containing exactly two columns; the first one is interpreted as time
    lag, ##<< lag time
    interpolation ##<< function used for interpolation
  ){
     t=map[,1]  
     y=map[,2]  
     o=order(t)
     tyo=cbind(t[o],y[o])
     #to=tyo[,1]+lag# account for the lag time
     to=tyo[,1] # since lag is also part of the result
     yo=tyo[,2]
     t_start=min(to)
     t_start=min(t)
     t_end=max(t)
     interpol=interpolation(to,yo)
     obj=new(Class="BoundInFlux",map=interpol,t_start,t_end,lag=lag) 
  return(obj)
  ### An object of class BoundInFlux that contains the interpolation function and the limits of the time range where the function is valid. Note that the limits change according to the time lag
  }
)

setMethod(
  f="BoundInFlux",
  signature=c(map="data.frame",starttime="missing",endtime="missing",lag="missing",interpolation="missing"),
  definition=function #constructor
  ### This function is another constructor of the class BoundInFlux.
  (map##<<A data frame containing exactly two columns; the first one is interpreted as time
   ){
     obj=BoundInFlux(map=map,lag=0,interpolation=splinefun) 
  return(obj)
  ### An object of class BoundInFlux that contains the interpolation function and the limits of the time range where the function is valid. Note that the limits change according to the time lag
  }
)
