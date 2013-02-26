\name{getMeanTransitTime}
\alias{getMeanTransitTime}
\title{Access to the mean transit time }
\description{This function computes the Expected Value of the transit time 
by integrating the product of t and the TransitTimeDistributionDensity}
\usage{getMeanTransitTime(object, inputDistribution)}
\arguments{
  \item{object}{a \code{\link{DecompositionOperator}} Object.}
  \item{inputDistribution}{a vector of length equal to the number of pools. The entries are weights, which must sum to 1.}
}


\references{Manzoni, S., G.G. Katul, and A. Porporato. 2009. Analysis of soil carbon transit times and age distributions using network theories.
Journal of Geophysical Research-Biogeosciences 114, DOI: 10.1029/2009JG001070.}
\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





