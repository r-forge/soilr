TimeMap.new=function
### This function is the basic constructor of the class TimeMap.
(t_start, ##<<A number marking the begin of the time domain where the function is valid
 t_end,   ##<<A number the end of the time domain where the function is valid
 f        ##<<The time dependent function definition (a function in R's sense)
 ){
   obj=new(Class="TimeMap",t_start,t_end,f) 
return(obj)
### An object of class TimeMap that can be used to describe models.
}
