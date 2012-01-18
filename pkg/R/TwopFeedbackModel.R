TwopFeedbackModel<-structure(
    function
    ### This function creates a model for two pools connected with feedback. It is a wrapper for the more general function \code{\link{GeneralModel}}.
     (t,    	##<< A vector containing the points in time where the solution is sought.
      ks,	##<< A vector of length 2 with the values of the decomposition rate for pools 1 and 2. 
      a21, ##<< A scalar with the value of the transfer rate from pool 1 to pool 2.
      a12, ##<< A scalar with the value of the transfer rate from pool 2 to pool 1.
      C0,	##<< A vector of length 2 containing the initial amount of carbon for the 2 pools.
      In,     ##<< A data.frame object specifying the amount of litter inputs by time. 
      xi=1,  ##<< A scalar or data.frame object specifying the external (environmental and/or edaphic) effects on decomposition rates.
      solver=deSolve.lsoda.wrapper  ##<< A function that solves the system of ODEs. This can be \code{\link{euler}} or \code{\link{ode}} or any other user provided function with the same interface.
    )	
    { 
      if(length(ks)!=2) stop("ks must be of length = 2")
      if(length(C0)!=2) stop("the vector with initial conditions must be of length = 2")
      
      if(length(In)==1) inputrates=function(t){matrix(nrow=2,ncol=1,c(In,0))}
      if(class(In)=="data.frame"){
         x=In[,1]  
         y=In[,2]  
         inputrate=function(t0){as.numeric(spline(x,y,xout=t0)[2])}
         inputrates=function(t){matrix(nrow=2,ncol=1,c(inputrate(t),0))}
        }
      A=-1*abs(diag(ks))
      A[2,1]=a21
      A[1,2]=a12
      
      if(length(xi)==1) fX=function(t){xi}
      if(class(xi)=="data.frame"){
        X=xi[,1]
        Y=xi[,2]
        fX=function(t){as.numeric(spline(X,Y,xout=t)[2])}
       }
      Af=function(t) fX(t)*A
      Mod=GeneralModel(t=t,A=Af,ivList=C0,inputrates=inputrates)
     return(Mod)
### A Model Object that can be further queried 
      ##seealso<< \code{\link{TwopParallelModel}}, \code{\link{TwopSeriesModel}} 
    }
    ,
    ex=function(){
      t_start=0 
      t_end=10 
      tn=50
      timestep=(t_end-t_start)/tn 
      t=seq(t_start,t_end,timestep) 
      ks=c(k1=0.8,k2=0.4)
      C0=c(C10=100,C20=150)
      In = 30
      
      Ex1=TwopFeedbackModel(t,ks,a21=0.5,a12=0.4,C0,In,xi=fT.Q10(15))
      Ct=getC(Ex1)
      Rt=getRelease(Ex1)
      
      plot(t,rowSums(Ct),type="l",ylab="Carbon stocks (arbitrary units)",xlab="Time (arbitrary units)",lwd=2,ylim=c(0,sum(Ct[1,]))) 
      lines(t,Ct[,1],col=2)
      lines(t,Ct[,2],col=4) 
      legend("topright",c("Total C","C in pool 1", "C in pool 2"),lty=c(1,1,1),col=c(1,2,4),lwd=c(2,1,1),bty="n")

      plot(t,rowSums(Rt),type="l",ylab="Carbon released (arbitrary units)",xlab="Time (arbitrary units)",lwd=2,ylim=c(0,40)) 
      lines(t,Rt[,1],col=2)
      lines(t,Rt[,2],col=4) 
      legend("topright",c("Total C release","C release from pool 1", "C release from pool 2"),lty=c(1,1,1),col=c(1,2,4),lwd=c(2,1,1),bty="n")
      
      Inr=data.frame(t,Random.inputs=rnorm(length(t),30,5))
      plot(Inr)
      
      Ex2=TwopFeedbackModel(t,ks,a21=0.5,a12=0.1,C0,In=Inr)
      Ctr=getC(Ex2)
      Rtr=getRelease(Ex2)
      
      plot(t,rowSums(Ctr),type="l",ylab="Carbon stocks (arbitrary units)",xlab="Time (arbitrary units)",lwd=2,ylim=c(0,sum(Ctr[1,]))) 
      lines(t,Ctr[,1],col=2)
      lines(t,Ctr[,2],col=4) 
      legend("topright",c("Total C","C in pool 1", "C in pool 2"),lty=c(1,1,1),col=c(1,2,4),lwd=c(2,1,1),bty="n")

      plot(t,rowSums(Rtr),type="l",ylab="Carbon released (arbitrary units)",xlab="Time (arbitrary units)",lwd=2,ylim=c(0,sum(Rtr[1,]))) 
      lines(t,Rtr[,1],col=2)
      lines(t,Rtr[,2],col=4) 
      legend("topright",c("Total C release","C release from pool 1", "C release from pool 2"),lty=c(1,1,1),col=c(1,2,4),lwd=c(2,1,1),bty="n")
}
)
