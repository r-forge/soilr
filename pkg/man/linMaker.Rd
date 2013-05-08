\name{linMaker}
\alias{linMaker}
\title{create a linear ode system from a (solved) nonlinear one}
\description{The function computes a (time dependent) coefficient from the pool solution and the globa solution}
\usage{linMaker(nonLinearPoolOutput, globalSolution, poolSolution)}
\arguments{
  \item{nonLinearPoolOutput}{the linearazed output operator for the pool}
  \item{globalSolution}{the global solution}
  \item{poolSolution}{the pool specific soulution}
}

\value{The coefficient as operator (function of Y and time). }

\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





