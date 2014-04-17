\name{Model_14_method__numeric_ANY_numeric_ANY_ANY_ANY_numeric_function_logical}
\alias{Model_14_method__numeric_ANY_numeric_ANY_ANY_ANY_numeric_function_logical}
\title{general  constructor for class Model_14}
\description{This method tries to create an object from any combination of arguments 
that can be converted into  the required set of building blocks for the Model_14
for n arbitrarily connected pools.}
\arguments{
  \item{t}{A vector containing the points in time where the solution is sought.}
  \item{A}{something that can be converted to any of the available DecompositionOperator classes}
  \item{ivList}{A vector containing the initial amount of carbon for the n pools. The length of this vector is equal to the number of pools and thus equal to the length of k. This is checked by an internal  function.}
  \item{initialValF}{An object of class ConstFc containing a vector with the initial values of the radiocarbon fraction for each pool and a format string describing in which format the values are given.}
  \item{inputFluxes}{something that can be converted to any of the available InFlux classes}
  \item{inputFc}{An object describing the fraction of C_14 in per mille (different formats are possible)}
  \item{c14DecayRate}{
}
  \item{solverfunc}{The function used by to actually solve the ODE system. This can be \code{\link{deSolve.lsoda.wrapper}} or any other user provided function with the same interface.}
  \item{pass}{Forces the constructor to create the model even if it is invalid}
}

\value{A model object that can be further queried. }

\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller
<mamueller@bgc-jena.mpg.de>}



\seealso{\code{\link{TwopParallelModel}}, \code{\link{TwopSeriesModel}}, \code{\link{TwopFeedbackModel}} }

