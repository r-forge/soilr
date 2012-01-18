test.TimeMap=function(){
   tstart=0
   tend=0
   f=function(t){2*t}

   obj=new(Class="TimeMap",tstart,tend,f)
   obj2=TimeMap.new(tstart,tend,f)
}

