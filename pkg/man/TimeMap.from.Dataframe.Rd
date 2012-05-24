\name{TimeMap.from.Dataframe}
\alias{TimeMap.from.Dataframe}
\title{TimeMap from Dataframe}

\usage{TimeMap.from.Dataframe(dframe, interpolation = splinefun)}
\arguments{
  \item{dframe}{A data frame containing exactly two columns:
the first one is interpreted as time}
  \item{interpolation}{A function that  returns a function  the default is splinefun. Other possible values are the linear interpolation approxfun or any self made function with the same interface.}
}



\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





