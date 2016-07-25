#
# vim:set ff=unix expandtab ts=2 sw=2:
transitTime<-structure(
  function #Transit times for compartment models
  ### Computes the density distribution and mean for the transit time of a compartmental model
  (A,  ##<< A compartmental linear square matrix with cycling rates in the diagonal and transfer rates in the off-diagonal.
   u,   ##<< A one-column matrix defining the amount of inputs per compartment.
   a=seq(0,100) ##<< A sequence of ages to calculate density functions   
  )
  {
    
    #Mean transit time
    d=dim(A)[1]
    one=matrix(1,nrow=1,ncol=d)
    beta=u/sum(u)
    z=(-1*t(A))%*%t(one)
    xss= (-1*solve(A))%*%u
    X=diag(as.numeric(xss)) # Diagonal matrix with steady-state solutions
    eta=xss/sum(xss)
    meanTransitTime=norm(solve(A)%*%beta)
    
    # Transit time density
    transitTimeDensity=NULL
    for(i in 1:length(a)){
      transitTimeDensity[i]=t(z)%*%expm(A*a[i])%*%beta
    }
    
    
    return(list(meanTransitTime=meanTransitTime,transitTimeDensity=transitTimeDensity)) 
    ### A list with 2 objects: mean transit time, and transit time density distribution.
    ##seealso<< \code{\link{systemAge}}
  }
  ,
  ex=function(){
    # Gaudinski model
    ks = c(kr = 1/1.5, koi = 1/1.5, koeal = 1/4, koeah = 1/80, 
           kA1 = 1/3, kA2 = 1/75, kM = 1/110)
    A = -abs(diag(ks))
    A[3, 2] = ks[2] * (98/(3 + 98 + 51))
    A[4, 3] = ks[3] * (4/(94 + 4))
    A[6, 5] = ks[5] * (24/(6 + 24))
    A[7, 6] = ks[6] * (3/(22 + 3))
    A[7, 2] = ks[2] * (3/(3 + 98 + 51))
    A[4, 1] = ks[1] * (35/(35 + 190 + 30))
    A[5, 1] = ks[1] * (30/(35 + 190 + 30))
    
    LI = 150 #Litter inputs
    RI = 255 #Root inputs
    In=matrix(nrow = 7, ncol = 1, c(RI, LI, 0, 0, 0, 0, 0))
    
    ages=seq(0,200)
    
    gtt=transitTime(A=A, u=In, a=ages)
    
    plot(ages, gtt$transitTimeDensity, type="l")
    abline(v=gtt$meanTransitTime, lty=2)
    legend("topright",c("Transit Time density",
           paste("Mean transit time = ",gtt$meanTransitTime)), 
           lty=1:2, bty="n")
    
    
  }
)
