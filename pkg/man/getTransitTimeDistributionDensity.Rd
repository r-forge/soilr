\name{getTransitTimeDistributionDensity}
\alias{getTransitTimeDistributionDensity}
\title{Access to the transit time distribution }
\description{This function computes the transit time distribution density  for a given time Decomposition Operator if it is time invariant 
by computing the output (respiration) of the system as a function of time according to an instantaneous input.}
\usage{getTransitTimeDistributionDensity(object, inputDistribution, 
    times)}
\arguments{
  \item{object}{a protoDecompositionOperator Object}
  \item{inputDistribution}{a vector of length equal to the number of pools. The entries are weights. That means that their sume must be equal to one!.}
  \item{times}{the times for which the distribution density is sought}
}
\details{The computation is based on the following assumptions which are requirements of the function and checked:
Let \eqn{O(t)} describe the overall output  flux of the system.
One can imagine  \eqn{O(t)} as a weighted sum of previous inputs \eqn{I(t-T)}. The weights for 
this summation are
described by the transit time distribution density \eqn{\psi(T,t)} where \eqn{T} is the 
transit time, the time from entry to exit of a particle and \eqn{t} the time of observation.
This is expressed by the following relation:
\eqn{O(t)=\int_0^\infty \psi(T,t) I(t-T) dT} which is universally true since everything coming out of the system must have entered at some point.
In the case of a time invariant decomposition operator and a time invariant input rate \eqn{I(t-T)} the system will eventually reach a stady state where in and outflow are balanced. In this case (which Erikson calles "stationary state" ) also the transit time distribution becomes time invariant: \eqn{\psi(T,t)=\psi(T)}.}

\references{Manzoni, S., G.G. Katul, and A. Porporato. 2009. Analysis of soil carbon transit times and age distributions using network theories.
Journal of Geophysical Research-Biogeosciences 114, DOI: 10.1029/2009JG001070.}
\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}





