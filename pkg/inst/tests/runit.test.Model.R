require(RUnit)
test.TwopParallelModel=function(){
   attr(TwopParallelModel,"ex")()
}
test.ThreepParallelModel=function(){
   attr(ThreepParallelModel,"ex")()
}
test.ParallelModel=function(){
  attr(ParallelModel,"ex")()
}
test.GeneralModel=function(){
  attr(GeneralModel,"ex")()
}
test.correctnessOfModel.incorrectModel=function(){
   t_start=0 
   t_end=10 
   tn=50
   timestep=(t_end-t_start)/tn 
   t=seq(t_start,t_end,timestep) 

   A=function(times){
      matrix(nrow=3,ncol=3,byrow=TRUE,
        c(-1,    0,    0, 
           1, -0.7,    0,   
           0,    1, -0.5)
   )
   }   
   res=correctnessOfModel(t,A)
   target=FALSE
   checkEquals(target, res, "correctnessOfModel should have returned FALSE because the model is impossible, but has not")

}
test.correctnessOfModel.correctModel=function(){
   t_start=0 
   t_end=10 
   tn=50
   timestep=(t_end-t_start)/tn 
   t=seq(t_start,t_end,timestep) 
   A=function(times){matrix(nrow=3,ncol=3,byrow=TRUE,
        c(-1,    0,    0, 
         0.5,   -2,    0,   
           0,    1, -0.5)
   )    
   }
   res=correctnessOfModel(t,A)
   target=TRUE
   checkEquals(target, res, "correctnessOfModel should have returned TRUE because the model was correct, but has not")

}
