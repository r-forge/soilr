correctnessOfNlModel=function
### The parameters used by the function \code{\link{GeneralNlModel}} in SoilR have a biological meaning, and therefore cannot be arbitrary.
### This functions tests some of the obvious constraints of the general model. 
### Up to now these are:
### 1) The compatibility of the decomposition rates and the transport parameters to and from other pools, i.e. 
### the column-wise sum of the elements cannot be negative. Otherwise this would create negative values of respiration, which are not biologically meaningful.
### 2) The compatibility of the time ranges of the supplied functions 

(object)
{   
    times=object@times
    Atm=object@mat
    ivList=object@initialValues
    InputFluxes=object@inputFluxes
    res=TRUE
     
    tA_min=getTimeRange(Atm)["t_min"]
    tA_max=getTimeRange(Atm)["t_max"]
    tI_min=getTimeRange(InputFluxes)["t_min"]
    tI_max=getTimeRange(InputFluxes)["t_max"]
    t_min=min(times)
    t_max=max(times)
    if (t_min<tA_min) {
        stop(simpleError("You ordered a timeinterval that starts earlier than the interval your matrix valued function A(t) is defined for. \n Have look at the timeMap object of A(t) or the data it is created from")
        )
    }
    if (t_max>tA_max) {
        stop(simpleError("You ordered a timeinterval that ends later than the interval your matrix valued function A(t) is defined for. \n Have look at the timeMap object of A(t) or the data it is created from")
        )
    }
    if (t_min<tI_min) {
        stop(simpleError("You ordered a timeinterval that starts earlier than the interval your function I(t) (InputFluxes) is defined for. \n Have look at the timeMap object of I(t) or the data it is created from")
        )
    }
    if (t_max>tI_max) {
        stop(simpleError("You ordered a timeinterval that ends later than the interval your function I(t) (InputFluxes) is defined for. \n Have look at the timeMap object of I(t) or the data it is created from")
        )
    }
    print("tests passed")
    return(res)
}
is.negative=function(number){
   ### the function returns True if the argumente is negative
   return(number<0)
}
### serves as a fence to the interface of SoilR functions. So that later implementations can differ	 
setClass(# NlModel
   Class="NlModel",
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
#   ,
#   prototype=prototype(
#        times=c(0,1),
#        mat=TimeMap.new(
#            0,
#            1,
#            function(t){
#                return(matrix(nrow=1,ncol=1,1))
#            }
#        ) 
#        ,
#        initialValues=numeric()
#        ,
#        inputFluxes= TimeMap.new(
#            0,
#            1,
#            function(t){
#                return(matrix(nrow=1,ncol=1,1))
#            }
#        )
#        ,
#        solverfunc=deSolve.lsoda.wrapper
#    )
#
    , validity=correctnessOfNlModel #set the validating function
)


setMethod(
    f="initialize",
    signature="NlModel",
    definition=function(
        .Object,
        times=c(0,1),
        mat=TimeMap.new(
                0,
                1,
                function(t){
                    return(matrix(nrow=1,ncol=1,0))
                }
        ) 
        ,
        initialValues=numeric()
        ,
        inputFluxes= TimeMap.new(
            0,
            1,
            function(t){
                return(matrix(nrow=1,ncol=1,1))
            }
        )
        ,
        solverfunc=deSolve.lsoda.wrapper
        ,
        pass=FALSE
        ){
       # cat("-initializer at work-\n")
        .Object@times=times
        .Object@mat=mat
        .Object@initialValues=initialValues
        .Object@inputFluxes=inputFluxes
        .Object@solverfunc=solverfunc
        #if (pass==FALSE) validObject(.Object) #call of the ispector if not explicitly disabled
        if (pass==FALSE) correctnessOfNlModel(.Object) #call of the ispector if not explicitly disabled
        return(.Object)
    }
)

setMethod(
   f= "plot",
      signature(x="NlModel"),
      definition=function(x){
      ### This function is a stub
      # It only starts the thing ...    
      plot(getTimes(x),getC(x)[,1])
   }
)
setMethod(
   f= "print",
      signature(x="NlModel"),
      definition=function(x){
      ### This function is a stub
      # It only starts the thing ...    
      print("Hi there I am the method print for model objects. Change me if you can")
      print(getC(x)[,1])
   }
)
setMethod(
   f= "summary",
      signature(object="NlModel"),
      definition=function(object){
      ### This function is a stub
      # It only starts the thing ...    
      print("Hi there, I am the method summarize for model objects. 
            I summarize everything....")
      print(getC(object)[,1])
   }
)
setMethod(
   f= "show",
      signature(object="NlModel"),
      definition=function(object){
      ### This function is a stub
      # It only starts the thing ...    
      print("Hi there I am the method show for model objects")
      print(getC(object)[,1])
   }
)
# now define a new generic function
setGeneric (
   name= "getTimes",
   
   def=function(#extract the times argumen
	### This functions extracts the times argument from an argument of class NlModel
   object){standardGeneric("getTimes")}

)
##to make sure that it gets not declared elsewhere without an error we do the following
#lockBinding("countMissing",.GlobalEnv)

#now define a method that implements this for our Class
setMethod(
   f= "getTimes",
      signature= "NlModel",
      definition=function(object){
      ### This functions extracts the times argument from an argument of class NlModel
         times=matrix(ncol=1,object@times)
         colnames(times)="times"
      return(times)
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
      signature= "NlModel",
      definition=function(object){
      ### This function computes the value for C (mass or concentration ) as function of time
      ns=length(object@initialValues)
      Atm=object@mat
      #print(Atm)
      ydot=getFunctionDefinition(Atm)
      #print(A)
      itm=object@inputFluxes
      inputrates=getFunctionDefinition(itm)
      #print(input)
      ydot_comp=function(y,t){
        D=ydot(y,t)+inputrates(t)
      }
      sVmat=matrix(object@initialValues,nrow=ns,ncol=1)
      Y=solver(object@times,ydot_comp,sVmat,object@solverfunc) 
      
      #print(Y)
      ### A matrix. Every column represents a pool and every row a point in time
      f=function(i){paste("C",i,sep="")}
      #colnames(Y)=sapply((1:ncol(Y)),f)
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
      signature= "NlModel",
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
      f=function(i){paste("ReleaseFlux",i,sep="")}
      #colnames(R)=sapply((1:ncol(R)),f)
      return(R)
   }
)
setGeneric ( # This function 
   name= "getAccumulatedRelease",
   def=function(# access to the Carbon release of the pools
   ### This function computes the overall  carbon release of the given model as funtion of time 
	object
	){standardGeneric("getAccumulatedRelease")}
)
setMethod(
   f= "getAccumulatedRelease",
      signature= "NlModel",
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
      f=function(i){paste("AccumulatedRelease",i,sep="")}
      #colnames(Y)=sapply((1:ncol(Y)),f)
      return(Y)
   }
)
# overload the [] operator
setMethod("[",signature(x="NlModel",i="character"), #since [] is a already defined generic the names of the arguments are not arbitrary 
        definition=function(x,i){
            getSingleCol=function(slot_name){
                res=""
                #print(paste(sep="",">",slot_name,"<"))
                if(slot_name=="times"){ res=getTimes(x)}
                if(slot_name=="C"){ res=getC(x)}
                if(slot_name=="ReleaseFlux"){ res=getReleaseFlux(x)}
                if(slot_name=="AccumulatedRelease"){ res=getAccumulatedRelease(x)}
                #if(res==""){stop(paste("The slot",slot_name,"is not defined"))}
                return(res)
            }
            n=length(i)
            df=getSingleCol(i[1])
            if (n>1){
                for (k in 2:n){
                    df=cbind(df,getSingleCol(i[k]))
                }
            }
            return(df)
        }
)
# overload the $ operator
setMethod("$",signature(x="NlModel"), #since $ is a already defined generic the names of the arguments are not arbitrary 
        definition=function(x,name){
            return(x[name])
        }
)

