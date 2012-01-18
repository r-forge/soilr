ThreepParallel=structure(function
(
 t,	##<< a vector containing the points in time where the solution is sougth
 k1,   		##<< the rate of decay in pool 1
 k2,   		##<< the same for pool 2
 k3,   		##<< the same for pool 3
 c10,  		##<< initial concentration for pool 1
 c20,  		##<< the same for pool 2
 c30,  		##<< the same for pool 3
 solver=deSolve.lsoda.wrapper 	##<< The function used by to actually solve the ode system. This can be \code{\link{euler}} or \code{\link{ode}} or any other user provided function with the same interface. 	
 ){
  Y=NpParallel(t,c(k1,k2,k3),c(c10,c20,c30),solver)
   ##note<< An executable example is attached to the function as attribute "ex"
   ## you can extract it with attr(TwopParrallelAnalytical,"ex")
   ### A matrix. Every column represents a pool and every row a point in time
   ##seealso<< \code{\link{TwopParallel}} \code{\link{TwopParallelAnalytical}}
}
,
ex=function(){
      require(SoilR)
      t_start=0 
      t_end=10 
      tn=50
      timestep=(t_end-t_start)/tn 
      t=seq(t_start,t_end,timestep) 
      k1=0.5
      k2=0.2
      k3=0.3
      c10=1
      c20=2
      c30=3
      Y=ThreepParallel(t,k1,k2,k3,c10,c20,c30)
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

