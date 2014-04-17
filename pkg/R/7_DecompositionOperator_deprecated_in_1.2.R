#
# vim:set ff=unix expandtab ts=2 sw=2:

setClass(# a decomposition operator described by a matrix valued function of time
    Class="DecompositionOperator",
    contains="DecompOp",   
    slots=list(
    map="function"
    ,
    lag="numeric"
    ,
    starttime="numeric"
    ,
    endtime="numeric"
    ) 
    
   )
#---------------------------------------------------------------------
setMethod(
    f="initialize",
    ### 
    signature="DecompositionOperator",
    definition=function #initialize called by (new)
    ### This is the internal constructor for objects 
    ### of the deprecated Class DecompositonOperator
    (.Object,
    starttime=numeric(),
    endtime=numeric(),
    map=function(t){t},
    lag=0
    ){
    warning("The class DecompositionOperator is deprecated. The fuctionallity is now implemented by class BoundLinDecompOp. To get rid of this warning change your code from:\n
    new(DecompositionOperator,other,args,...) to \n
    BoundLinDecompOp(other,args,...) ")
    .Object@starttime=starttime
    .Object@endtime=endtime
    .Object@map=map
    .Object@lag=lag
    return(.Object)
    }
)
##---------------------------------------------------------------------
#setMethod(
#      f="DecompositionOperator",
#      ### 
#      signature=c(map="function",starttime="missing",endtime="missing",lag="numeric"),
#      definition=function # a constructor for a single function without limits  
#      ### This method creates a DecompositionOperator from a timedependent function and a lag only
#      (map,lag=0){
#      return(new("DecompositionOperator",starttime=-Inf,endtime=Inf,map=map))
#    }
#)
#---------------------------------------------------------------------
setMethod(
    f="getTimeRange",
    signature="DecompositionOperator",
    definition=function # ask for the boundaries of the underlying time interval
    ### The method returns the time range of the given object 
    ### It is ( probably mostly ) used internally to make sure that 
    ### time dependent functions retrieved from data are not
    ### used outside the interval where they are valid. 
    
    (object 
    ){
        return( c("t_min"=object@starttime,"t_max"=object@endtime))
        ### a vector of length two \code{ c(t_min,t_max) }
        ### containing start and end time of the time interval 
        ### for which the object has been defined.
    }
)
#---------------------------------------------------------------------
setMethod(
    f="getFunctionDefinition",
    signature="DecompositionOperator",
    definition=function(object){
    ### extract the function definition (the R-function) 
        return(object@map)
    }
)

