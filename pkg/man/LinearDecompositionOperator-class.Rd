\name{LinearDecompositionOperator-class}
\Rdversion{1.1}
\docType{class}
\alias{LinearDecompositionOperator-class}
\title{Class \code{"LinearDecompositionOperator"}}
\description{
NA
}
\section{Slots}{
  \describe{
    \item{\code{map}:}{Object of class \code{"function"} ~~ }
    \item{\code{lag}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{starttime}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{endtime}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Extends}{
Class \code{"\linkS4class{DecompositionOperator}"}, directly.
}
\section{Methods}{
  \describe{
    \item{getFunctionDefinition}{\code{signature(object = "LinearDecompositionOperator")}: ... }
    \item{getTimeRange}{\code{signature(object = "LinearDecompositionOperator")}: ... }
    \item{initialize}{\code{signature(.Object = "LinearDecompositionOperator")}: ... }
	 }
}
\author{
 Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de> 
}
\examples{
showClass("LinearDecompositionOperator")
}
\keyword{classes}
