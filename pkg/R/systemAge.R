#
# vim:set ff=unix expandtab ts=2 sw=2:
systemAge<-structure(
  function #System and pool age for compartment models
  ### Computes the density distribution and mean for the system and pool ages of a SoilR model or a matrix representation of a compartmental model
  (A,  ##<< A compartmental linear square matrix with cycling rates in the diagonal and transfer rates in the off-diagonal.
   u,   ##<< A one-column matrix defining the amount of inputs per compartment.
   a=seq(0,100) ##<< A sequence of ages to calculate density functions   
  )
  {
    
    #Mean system age
    d=dim(A)[1]
    one=matrix(1,nrow=1,ncol=d)
    beta=u/sum(u)
    z=(-1*t(A))%*%t(one)
    xss= (-1*solve(A))%*%u
    X=diag(as.numeric(xss)) # Diagonal matrix with steady-state solutions
    eta=xss/sum(xss)
    meanSystemAge=(-1*one)%*%solve(A)%*%eta
    
    # System age density
    systemAgeDensity=NULL
    for(i in 1:length(a)){
      systemAgeDensity[i]=t(z)%*%expm(A*a[i])%*%eta
    }
    
    # Pool age density
    poolAgeDensity=NULL
    for(i in 1:length(a)){
      tmp=t((solve(X))%*%expm(A*a[i])%*%u)
      poolAgeDensity=rbind(poolAgeDensity,tmp)
    }
    
    # Mean pool-age
    meanPoolAge=-1*(solve(X))%*%solve(A)%*%xss

    
  return(list(meanSystemAge=meanSystemAge,systemAgeDensity=systemAgeDensity, 
              poolAgeDensity=poolAgeDensity, meanPoolAge=meanPoolAge))    
        ### A list with 4 objects: mean system age, system age distribution, mean pool-age, and pool-age distribution.
        ##seealso<< \code{\link{transitTime}}
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
      
    ga=systemAge(A=A, u=In, a=ages)
    
    plot(ages, ga$systemAgeDensity, type="l")
    abline(v=ga$meanSystemAge, lty=2)
    legend("topright",c("System Age density",
            paste("Mean system age = ",ga$meanSystemAge)), 
            lty=1:2, bty="n")
    
    pools=c("Roots", "Oi", "Oe/a L", "Oe/a H", "A, LF (>80 um)",
             "A, LF (< 80 um)", "Min. Ass.")
    par(mfrow=c(3,2))
    for(i in 2:7){
      plot(ages,ga$poolAgeDensity[,i],type="l", main=pools[i], 
           ylab="Probability density", xlab="Age", bty="n")
    }
    par(mfrow=c(1,1))
    
    
  }
)
