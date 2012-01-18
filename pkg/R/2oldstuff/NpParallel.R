NpParallel=structure(function
### The function computes the solution for n independent (parallel) pools numerically.
### It is used by the convinient wrapper functions \code{\link{TwopParallel}} and \code{\link{ThreepParallel}}
### but can also be used independently.
(t,			##<< a vector containing the points in time where the solution is sougth
 k,			##<< a vector containing the decay rates for the n pools. The length of this vector is equal to the number of pools.
 ivList,		##<< a vector containing the initial concentrations for the n pools. The length of this vector is equal to the number of pools and thus equal to the length of k. This is checked by the function.
 solverfunc=deSolve.lsoda.wrapper		##<< The function used by to actually solve the ode system. This can be \code{\link{SoilR.euler}} or \code{\link{deSolve.lsoda.wrapper}} or any other user provided function with the same interface. 
 )
{
   ns=length(ivList)
   nk=length(k)
   if (nk!=ns){
      print("error")
      }
   else{
      A=diag(x=k)
      Y=NpGeneral(t,A,ivList,solverfunc)
   }
   return(Y)
   ### A matrix. Every column represents a pool and every row a point in time
   ##seealso<< \code{\link{TwopParallel}} \code{\link{TwopParallelAnalytical}}
}
,ex=function(){
      require(SoilR)
      t_start=0 
      t_end=10 
      tn=50
      timestep=(t_end-t_start)/tn 
      t=seq(t_start,t_end,timestep) 
      k=c(0.5, 0.2, 0.3)
      c0=c(1, 2, 3)
      Y=NpParallel(t,k,c0)
      y1=Y[,1]
      y2=Y[,2]
      y3=Y[,3]
      lt1=1 
      lt2=2 
      lt3=3 
      col1=1
      col2=2
      col3=3
      plot(t,y1,type="l",lty=lt1,col=col1,
	   ylab="Concentrations",xlab="Time") 
      lines(t,y2,type="l",lty=lt2,col=col2) 
      lines(t,y3,type="l",lty=lt3,col=col3) 
      legend(
	 "topleft",
	 c("Concentration of pool 1",
	   "Concentration of pool 2",
	   "Concentration of pool 3"
	 ),
	 lty=c(lt1,lt2,lt3),
	 col=c(col1,col2,col3)
      )
 
}       
)
