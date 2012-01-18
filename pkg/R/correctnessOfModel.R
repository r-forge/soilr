correctnessOfModel=function
### The parameters used by the function \code{\link{GeneralModel}} in SoilR have a biological meaning, and therefore cannot be arbitrary.
### This functions tests some of the obvious constraints of the general model. 
### Up to now these are:
### 1) The compatibility of the decomposition rates and the transport parameters to and from other pools, i.e. 
### the column-wise sum of the elements cannot be negative. Otherwise this would create negative values of respiration, which are not biologically meaningful. 


(times,			##<< A vector containing the points in time where the solution is sought. 
 A			##<< A matrix valued function containing the whole model decomposition rates , connection and feedback coefficients for the n pools. The size of this matrix is equal to the number of pools.
)
{   
    #compute the respiration coefficients as funtions of time
    rcoeffs=RespirationCoefficients(A)
    r=sapply(times,rcoeffs)
    #mark the negative respirations (which will trigger the refusal of the matrix )
    truthv=sapply(r,is.negative)
    #find the bad columns 
    positions=grep("TRUE",truthv)
    if (length(positions)>0){
       print("The following columns contain unreasonable entries that lead to negative respirations for these pools. Please check your matrix as function of time.")
        res=FALSE}
    else {
       res=TRUE
    }
   return(res)
}
is.negative=function(number){
   return(number<0)
}
