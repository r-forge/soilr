\name{MeanAge}
\alias{MeanAge}
\title{mean age for a general one pool model}
\description{The function computes the mean age for one pool of a possibly nonlinear model}
\usage{MeanAge(IdotT, OdotLin, sol, times)}
\arguments{
  \item{IdotT}{The inputrate as a function of time}
  \item{OdotLin}{The outputrate of this pool as a linear operator (a function of y and t)}
  \item{sol}{The solution of the nonlinear equation for this pool as a function of time}
  \item{times}{A vector containing the points in time where the solution is sought.}
}

\value{A vector containing the mean age for the specified times}

\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





