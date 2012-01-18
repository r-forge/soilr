ExamplePlotTwopParallel=function(){
   require(SoilR)
      t_start=0 
      t_end=10 
      tn=50
      timestep=(t_end-t_start)/tn 
      t=seq(t_start,t_end,timestep) 
      k1=-0.5
      k2=-0.2
      c10=100
      c20=150
      #new approach 
      Res=nTwopParallel(t,k1,k2,c10,c20)
      Y=getConcentrations(Res)
      #Y=TwopParallel(t,k1,k2,c10,c20)
      lt1=2 
      lt2=3 
      col1=1
      col2=2
      plot(t,Y[,1],type="l",lty=lt1,col=col1,ylab="Concentrations",xlab="Time") 
      lines(t,Y[,2],lt2,type="l",lty=lt2,col=col2) 
      legend("topright",c("c1","c2"),lty=c(lt1,lt2),col=c(col1,col2))
 
}
