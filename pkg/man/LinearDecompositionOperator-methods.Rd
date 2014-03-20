\name{LinearDecompositionOperator-methods}
\docType{methods}
\alias{LinearDecompositionOperator-methods}
\alias{LinearDecompositionOperator,ConstantDecompositionOperator,ANY,ANY,ANY-method}
\alias{LinearDecompositionOperator,TimeMap,missing,missing,missing-method}
\alias{LinearDecompositionOperator,function,missing,missing,numeric-method}
\title{ ~~ Methods for Function \code{LinearDecompositionOperator}  ~~}
\description{
 ~~ Methods for function \code{LinearDecompositionOperator} ~~
}
\section{Methods}{
  \describe{
    \item{\code{signature(map = "ConstantDecompositionOperator", starttime = "ConstantDecompositionOperator", endtime = "ConstantDecompositionOperator", lag = "ConstantDecompositionOperator")}}{
      \code{\link{LinearDecompositionOperator_method__ConstantDecompositionOperator}}  
    }
    \item{\code{signature(map = "TimeMap", starttime = "missing", endtime = "missing", lag = "missing")}}{
      \code{\link{LinearDecompositionOperator_method__TimeMap_missing_missing_missing}}  
    }
    \item{\code{signature(map = "function", starttime = "missing", endtime = "missing", lag = "numeric")}}{
      \code{\link{LinearDecompositionOperator_method__function_missing_missing_numeric}}  
    }

  }
}
\keyword{methods}
\keyword{ ~~ other possible keyword(s) ~~ }
