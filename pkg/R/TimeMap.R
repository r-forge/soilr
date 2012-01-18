setClass(# TimeMap
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
        cat("-initializer at work-\n")
        .Object@starttime=starttime
        .Object@endtime=endtime
        .Object@map=map
        return(.Object)
    }
)

