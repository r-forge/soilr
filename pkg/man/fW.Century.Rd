\name{fW.Century}
\alias{fW.Century}
\title{fW Century}
\description{Calculates the effects of precipitation and potential evapotranspiration on decomposition rates.}
\usage{fW.Century(PPT, PET)}
\arguments{
  \item{PPT}{A scalar or vector containing values of monthly precipitation.}
  \item{PET}{A scalar or vector containing values of potential evapotranspiration.}
}

\value{A scalar or a vector containing the effects of precipitation and potential evapotranspiration on decomposition rates (unitless).}
\references{Adair, E. C., W. J. Parton, S. J. D. Grosso, W. L. Silver, M. E. Harmon, S. A. Hall, I. C. Burke, and S. C. Hart (2008), 
Simple three-pool model accurately describes patterns of long-term litter decomposition in diverse climates, Global Change Biology, 14(11), 2636-2660.
 Parton, W. J., J. A. Morgan, R. H. Kelly, and D. S. Ojima (2001), Modeling soil C responses to environmental change in grassland systems, 
in The potential of U.S. grazing lands to sequester carbon and mitigate the greenhouse effect, edited by R. F. Follett, J. M. Kimble and R. Lal, pp. 371-398, Lewis Publishers, Boca Raton.}
\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller <mamueller@bgc-jena.mpg.de>}
\note{The original formula in Adair et al. (2008) was modified due to a potential error. We use the ratio PET/PTT instead of PPT/PET.}



\examples{
PET=seq(0,1500,by=10)
PPT=rep(1500,length(PET))
PPT.PET=fW.Century(PPT,PET)
plot(PET/PPT,PPT.PET, ylab="f(PPT, PET) (unitless)", main="Effects of precipitation and potential evapotranspiration on decomposition rates")
}
