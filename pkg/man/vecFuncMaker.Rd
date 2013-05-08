\name{vecFuncMaker}
\alias{vecFuncMaker}
\title{creates a vector valued function from the functions for the components}
\description{The function is a helper to create a vector valued function of two arguments which is very useful to create systems of ode}
\usage{vecFuncMaker(funcs, arg1, arg2)}
\arguments{
  \item{funcs}{The list of functions computing the vector components}
  \item{arg1}{The first argument of the component functions}
  \item{arg2}{The second argument of the component functions}
}

\value{A vector valued function with the vector size equal to the number of 
functions in the first argument}

\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





