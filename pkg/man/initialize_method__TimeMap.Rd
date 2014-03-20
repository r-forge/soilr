\name{initialize_method__TimeMap}
\alias{initialize_method__TimeMap}
\title{initialize called by (new)}
\description{This is the standard constructor for objects of this class
It is called by statements of the form 
\code{new("TimeMap",start,end,f,lag)}}
\arguments{
  \item{.Object}{
}
  \item{starttime}{
}
  \item{endtime}{
}
  \item{map}{
}
  \item{lag}{
}
}



\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}




\examples{# Create an explicit example of a TimeMap
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

}
