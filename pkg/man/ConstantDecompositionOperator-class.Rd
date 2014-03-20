\name{ConstantDecompositionOperator-class}
\Rdversion{1.1}
\docType{class}
\alias{ConstantDecompositionOperator-class}
\title{Class \code{"ConstantDecompositionOperator"}}
\description{
NA
}
\section{Slots}{
  \describe{
    \item{\code{mat}:}{Object of class \code{"matrix"} ~~ }
  }
}
\section{Extends}{
Class \code{"\linkS4class{DecompositionOperator}"}, directly.
}
\section{Methods}{
  \describe{
    \item{LinearDecompositionOperator}{\code{signature(map = "ConstantDecompositionOperator", starttime = "ANY", endtime = "ANY", lag = "ANY")}: ... }
    \item{getFunctionDefinition}{\code{signature(object = "ConstantDecompositionOperator")}: ... }
    \item{getMeanTransitTime}{\code{signature(object = "ConstantDecompositionOperator")}: ... }
    \item{getTimeRange}{\code{signature(object = "ConstantDecompositionOperator")}: ... }
    \item{getTransitTimeDistributionDensity}{\code{signature(object = "ConstantDecompositionOperator")}: ... }
    \item{initialize}{\code{signature(.Object = "ConstantDecompositionOperator")}: ... }
	 }
}
\author{
 Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de> 
}
\examples{
showClass("ConstantDecompositionOperator")
}
\keyword{classes}
