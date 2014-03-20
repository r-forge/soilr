\name{TimeMap-class}
\Rdversion{1.1}
\docType{class}
\alias{TimeMap-class}
\title{Class \code{"TimeMap"}}
\description{
defines a (time dependent) mapping including the function definition and the ### domain where the function is well define.  This can be used to avoid interpolations out of range when mixing different time dependent data sets
}
\section{Slots}{
  \describe{
    \item{\code{map}:}{Object of class \code{"function"} ~~ }
    \item{\code{lag}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{starttime}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{endtime}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{DecompositionOperator}{\code{signature(object = "TimeMap")}: ... }
    \item{InputFlux}{\code{signature(object = "TimeMap")}: ... }
    \item{LinearDecompositionOperator}{\code{signature(map = "TimeMap", starttime = "missing", endtime = "missing", lag = "missing")}: ... }
    \item{TemporaryInputFlux}{\code{signature(map = "TimeMap", starttime = "missing", endtime = "missing", lag = "missing")}: ... }
    \item{as.character}{\code{signature(x = "TimeMap")}: ... }
    \item{getFunctionDefinition}{\code{signature(object = "TimeMap")}: ... }
    \item{getTimeRange}{\code{signature(object = "TimeMap")}: ... }
    \item{initialize}{\code{signature(.Object = "TimeMap")}: ... }
	 }
}
\author{
 Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de> 
}
\examples{
showClass("TimeMap")
}
\keyword{classes}
