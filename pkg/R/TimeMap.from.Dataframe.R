TimeMap.from.Dataframe=function
### This function is the basic constructor of the class TimeMap.
(dframe, ##<<A data frame containing exactly two columns:
## the first one is interpreted as time
interpolation=splinefun ##<<A function that  returns a function  the default is splinefun. Other possible values are the linear interpolation approxfun or any self made function with the same interface.
 ){
   t=dframe[,1]  
   y=dframe[,2]  
   o=order(t)
   tyo=rbind(t[o],y[o])
   to=tyo[,1]
   yo=tyo[,2]
   t_start=min(to)
   interpol=splinefun(to,yo)
   t_start=min(t)
   t_end=max(t)
   interpol=interpolation(to,yo)
   obj=new(Class="TimeMap",t_start,t_end,interpol) 
return(obj)
### An object of class TimeMap that contains the interpolation function and the limits of the time range where the function is valid.
### this serves as a saveguard for Model which thus can check that all involved functions of time are actually defined for the times of interest  
}
