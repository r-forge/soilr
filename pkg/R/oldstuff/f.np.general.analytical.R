f.np.general.analytical=function(t,A,c){
   #determine the number of pools 
   n=nrow(A)
   ew=eigen(A)
   # the function eigen does not count the size of the eingenspace 
   # which is good for the construction of the p functions
   # which we will do in matrix based fashion
   P=diag(ew$values,nrow=n)
   for (i in 2:n){
	 P[i,i-1]=1
   }

   #determine the number of time values for which the solution is sought
   tn=length(t) 
   Y=matrix(nrow=n,ncol=tn)
      for (i in 1:n){
	 Y[i,1]=c[i]
      }
      for (j in 2:tn){
	 timestep=t[j]-t[j-1]
         Y[1:n,j]=Y[1:n,j-1]+timestep*A%*%Y[1:n,j-1]
      }
   return(Y)
}

