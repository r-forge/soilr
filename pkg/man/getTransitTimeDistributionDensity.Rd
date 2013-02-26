\name{getTransitTimeDistributionDensity}
\alias{getTransitTimeDistributionDensity}
\title{Access to the transit time distribution }
\description{This function computes the transit time distribution density  for a given Decomposition Operator
by computing the output (respiration) of the system according to an instantaneous input.}
\usage{getTransitTimeDistributionDensity(object, inputDistribution, 
    times)}
\arguments{
  \item{object}{a DecompositionOperator Object}
  \item{inputDistribution}{a vector of length equal to the number of pools. The entries are weights. That means that their sume must be equal to one!.}
  \item{times}{the times for which the distribution density is sought}
}
\details{Let \eqn{O(t)} describe the overall output  flux of the system.
One can imagine  \eqn{O(t)} as a weighted sum of previous inputs \eqn{I(t-T)}. The weights for 
this summation are
described by the transit time distribution density \eqn{\psi(T)} where \eqn{T} is the 
transit time, the time from entry to exit of a particle.
This is expressed by the following relation:
\eqn{O(t)=\int_0^\infty \psi(T) I(t-T) dT}
For an instantaneous input \eqn{I(t-T)=\delta(t-T)} the transit time distribution density becomes
equal to the output of the system, the release rate. 
we can therefore compute the transfer time distribution by applying our Decomposition Operator to an 
instantaneous input, which is realized by an inputrate of zero and startvalues of one.}

\references{Manzoni, S., G.G. Katul, and A. Porporato. 2009. Analysis of soil carbon transit times and age distributions using network theories.
Journal of Geophysical Research-Biogeosciences 114, DOI: 10.1029/2009JG001070.}
\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





