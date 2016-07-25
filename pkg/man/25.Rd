\name{BoundInFlux-class}
\Rdversion{1.1}
\docType{class}
\alias{BoundInFlux-class}
\title{Class \code{"BoundInFlux"}}
\description{
defines a time dependent inputrate as function of time and including the domain where the function is well defined. This can be used to avoid interpolations out of range when mixing different time dependent data sets
}
\section{Slots}{
  \describe{
    \item{\code{starttime}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{endtime}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{map}:}{Object of class \code{"function"} ~~ }
    \item{\code{lag}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Extends}{
Class \code{"\linkS4class{InFlux}"}, directly.
Class \code{"\linkS4class{TimeMap}"}, directly.
}
\section{Methods}{
No methods defined with class "BoundInFlux" in the signature.
}
\author{
 Carlos A. Sierra, Markus Mueller 
}
\examples{
showClass("BoundInFlux")
}
\keyword{classes}
