\name{BoundFc-class}
\Rdversion{1.1}
\docType{class}
\alias{BoundFc-class}
\title{Class \code{"BoundFc"}}
\description{
Objects of this class contain a time dependent function describing the Atmospheric \eqn{^{14}C}{14C} fraction and a format description, that allows to use the numeric valuest to be interpreted correctly in subsequent computations.
}
\section{Slots}{
  \describe{
    \item{\code{format}:}{Object of class \code{"character"} ~~ }
    \item{\code{map}:}{Object of class \code{"function"} ~~ }
    \item{\code{lag}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{starttime}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{endtime}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Extends}{
Class \code{"\linkS4class{TimeMap}"}, directly.
}
\section{Methods}{
  \describe{
    \item{AbsoluteFractionModern}{\code{signature(F = "BoundFc")}: ... }
    \item{Delta14C}{\code{signature(F = "BoundFc")}: ... }
    \item{getFormat}{\code{signature(object = "BoundFc")}: ... }
    \item{initialize}{\code{signature(.Object = "BoundFc")}: ... }
	 }
}
\author{
 Carlos A. Sierra, Markus Mueller 
}
\examples{
showClass("BoundFc")
}
\keyword{classes}
