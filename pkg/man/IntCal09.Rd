\name{IntCal09}
\alias{IntCal09}
\docType{data}
\title{
Northern Hemisphere atmospheric radiocarbon for the pre-bomb period
}
\description{
Atmospheric radiocarbon data from Reimer et al. (2009). This is the standard age calibration curve, which also gives the Delta14C value of atmospheric CO2. 
}
\usage{data(IntCal09)}
\format{
  A data frame with 3522 observations on the following 5 variables.
  \describe{
    \item{\code{CAL.BP}}{Calibrated age in years Before Present (BP).}
    \item{\code{C14.age}}{C14 age in years BP.}
    \item{\code{Error}}{Error estimate for \code{C14.age}.}
    \item{\code{Delta.14C}}{Delta14C value in per mil.}
    \item{\code{Sigma}}{Standard deviation of \code{Delta14.C} in per mil.}
  }
}
\details{
Deltal.14C is age-corrected as per Stuiver and Polach (1977). All details about the derivation of this dataset are provided in Reimer et al. (2009).
}

\source{
\url{
  http://www.radiocarbon.org/IntCal09%20files/intcal09.14c
  }
}
\references{

P. Reimer, M.Baillie, E. Bard, A. Bayliss, J. Beck, P. Blackwell, C. Ramsey, C. Buck, G. Burr, R. Edwards, et al. 2009. IntCal09 and Marine09 radiocarbon age calibration curves, 0 - 50,000 years cal bp. Radiocarbon, 51(4):1111 - 1150.


M. Stuiver and H. A. Polach. 1977. Rerporting of C-14 data. Radiocarbon, 19(3):355 - 363.
}
\examples{
data(IntCal09)
plot(IntCal09$CAL.BP,IntCal09$Delta.14C,type="l")
}
\keyword{datasets}
