nTwopParallel<-structure(
    function
    ### The function computes the solution for two independent (parallel) pools numerically.
    ### Actually it is only a wrapper for the more general function
    ### NpParallel() that can handle an arbitrary number of pools.
    (t,			##<< a vector containing the points in time where the solution is sougth
     k1,    		##<< the rate of decay in pool 1
     k2,			##<< the same for pool 2
     c10,			##<< initial concentration for pool 1
     c20, 			##<< the same for pool 2
     solverfunc=deSolve.lsoda.wrapper
    )	##<< The function used by to actually solve the ode system. This can be \code{\link{euler}} or \code{\link{ode}} or any other user provided function with the same interface. 
    {
      res=ParallelModel(t,c(k1,k2),c(c10,c20),solverfunc)
       ### A Model Object that can be further queried 
    }
    #we attach an example that we also use in the documentation of another function
    ,
    ex=function(){
      t_start=0 
      t_end=10 
      tn=50
      timestep=(t_end-t_start)/tn 
      t=seq(t_start,t_end,timestep) 
      k1=-0.5
      k2=-0.2
      c10=100
      c20=150
      res=nTwopParallel(t,k1,k2,c10,c20)
      t=getTimes(res)
      cat(t)
      Y=getCcontent(res)
      cat(Y)
      lt1=2 
      lt2=3 
      col1=1
      col2=2
      plot(t,Y[,1],type="l",lty=lt1,col=col1,ylab="Concentrations",xlab="Time") 
      lines(t,Y[,2],lt2,type="l",lty=lt2,col=col2) 
      legend("topright",c("c1","c2"),lty=c(lt1,lt2),col=c(col1,col2))
      
      Y=getRespiration(res)
      cat(Y)
      plot(t,Y[,1],type="l",lty=lt1,col=col1,ylab="Respirations",xlab="Time") 
      lines(t,Y[,2],lt2,type="l",lty=lt2,col=col2) 
      legend("topright",c("R1","R2"),lty=c(lt1,lt2),col=c(col1,col2))
 
}
)
