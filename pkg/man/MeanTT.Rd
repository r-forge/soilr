\name{MeanTT}
\alias{MeanTT}
\title{mean transit time for a general one pool model}
\description{The function computes the mean transit time for one pool of a possibly nonlinear model}
\usage{MeanTT(OdotLin, times)}
\arguments{
  \item{OdotLin}{The outputrate of this pool as a linear operator (a function of y and t)}
  \item{times}{A vector containing the points in time where the solution is sought.}
}

\value{A vector containing the mean transit time for the specified times}

\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





