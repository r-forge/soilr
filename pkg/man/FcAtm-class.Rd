\name{FcAtm-class}
\Rdversion{1.1}
\docType{class}
\alias{FcAtm-class}
\alias{FcAtm}
%% \alias{AbsoluteFractionModern}
%% \alias{Delta14C}
%% \alias{getFormat}
%% \alias{initialize}

\title{A special form of TimeMap containing the atmospheric C14 fraction and the format it is provided in. }
\description{###########################################################################################}
\section{Objects from the Class}{Objects can be created by calls of the form \code{new(FcAtm ...)}}
\section{Slots}{
  \describe{
    \item{\code{format}:}{Object of class \code{"character"}}
    \item{\code{starttime}:}{Object of class \code{"numeric"}}
    \item{\code{endtime}:}{Object of class \code{"numeric"}}
    \item{\code{map}:}{Object of class \code{"function"}}
    \item{\code{lag}:}{Object of class \code{"numeric"}}
  }
}
\section{Extends}{
Class \code{"\linkS4class{TimeMap}"}, directly.
}
\section{Methods}{
  \describe{
    \item{AbsoluteFractionModern}{\code{signature(F = "FcAtm")}: ... }
    \item{Delta14C}{\code{signature(F = "FcAtm")}: ... }
    \item{getFormat}{\code{signature(object = "FcAtm")}: ... }
    \item{initialize}{\code{signature(.Object = "FcAtm")}: ... }
	 }
}

\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





