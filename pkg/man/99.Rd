\name{TimeMap_method__data.frame_missing_missing}
\alias{TimeMap_method__data.frame_missing_missing}
\title{constructor}
\description{create a  TimeMap object by interpolating the data.frame }
\arguments{
  \item{map}{
}
  \item{lag}{
}
  \item{interpolation}{
}
}

\value{An object of class TimeMap that contains the interpolation function and the limits of the time range where the function is valid. Note that the limits change according to the time lag
this serves as a saveguard for Model which thus can check that all involved functions of time are actually defined for the times of interest  }

\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller
<mamueller@bgc-jena.mpg.de>}





