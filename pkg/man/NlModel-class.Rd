\name{NlModel-class}
\Rdversion{1.1}
\docType{class}
\alias{NlModel-class}
\alias{NlModel}
\alias{[,NlModel}
%% \alias{$}
%% \alias{getAccumulatedRelease}
%% \alias{getC}
%% \alias{getReleaseFlux}
%% \alias{getTimes}
%% \alias{initialize}
%% \alias{plot}
%% \alias{print}
%% \alias{show}
%% \alias{summary}

\title{NlModel}
\description{serves as a fence to the interface of SoilR functions. So that later implementations can differ	 }
\section{Objects from the Class}{Objects can be created by calls of the form \code{new(NlModel ...)}}
\section{Slots}{
  \describe{
    \item{\code{times}:}{Object of class \code{"numeric"}}
    \item{\code{mat}:}{Object of class \code{"TimeMap"}}
    \item{\code{initialValues}:}{Object of class \code{"numeric"}}
    \item{\code{inputFluxes}:}{Object of class \code{"TimeMap"}}
    \item{\code{solverfunc}:}{Object of class \code{"function"}}
  }
}
\section{Methods}{
  \describe{
    \item{[}{\code{signature(x = "NlModel", i = "character", j = "ANY", drop = "ANY")}: ... }
    \item{$}{\code{signature(x = "NlModel")}: ... }
    \item{getAccumulatedRelease}{\code{signature(object = "NlModel")}: ... }
    \item{getC}{\code{signature(object = "NlModel")}: ... }
    \item{getReleaseFlux}{\code{signature(object = "NlModel")}: ... }
    \item{getTimes}{\code{signature(object = "NlModel")}: ... }
    \item{initialize}{\code{signature(.Object = "NlModel")}: ... }
    \item{plot}{\code{signature(x = "NlModel")}: ... }
    \item{print}{\code{signature(x = "NlModel")}: ... }
    \item{show}{\code{signature(object = "NlModel")}: ... }
    \item{summary}{\code{signature(object = "NlModel")}: ... }
	 }
}

\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





