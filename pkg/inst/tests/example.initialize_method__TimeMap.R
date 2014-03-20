# Create an explicit example of a TimeMap
inputFluxes=new(
  "TimeMap",
  starttime=0,
  endtime=10,
  function(t0){5*t0}
) 
# now it you only have the inputFluxes object
# you can ask it for which time interval it was specified
# 
print(getTimeRange(inputFluxes))
# or even print it directly because the TimeMap class also 
# implements a method for the as.character generic 
print(inputFluxes)


