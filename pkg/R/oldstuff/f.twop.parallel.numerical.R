f.twop.parallel.numerical<- function(t,k1,k2,c10,c20){
      y1=NULL
      y2=NULL
      y1[1]=c10
      y2[1]=c20
      #Euler Forward
      for (i in 2:length(t)){
         y1[i]=y1[i-1]+k1*y1[i-1]*h
         y2[i]=y2[i-1]+k2*y2[i-1]*h
      }
   return(list(y1=y1,y2=y2))
}

