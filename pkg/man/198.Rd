\name{systemAge}
\alias{systemAge}
\title{System and pool age for compartment models}
\description{Computes the density distribution and mean for the system and pool ages of a SoilR model or a matrix representation of a compartmental model}
\usage{systemAge(A, u, a = seq(0, 100))}\arguments{
  \item{A}{A compartmental linear square matrix with cycling rates in the diagonal and transfer rates in the off-diagonal.}
  \item{u}{A one-column matrix defining the amount of inputs per compartment.}
  \item{a}{A sequence of ages to calculate density functions}
}

\value{A list with 4 objects: mean system age, system age distribution, mean pool-age, and pool-age distribution.}

\author{Carlos A. Sierra, Markus Mueller}



\seealso{\code{\link{transitTime}}}
\examples{
# Gaudinski model
ks = c(kr = 1/1.5, koi = 1/1.5, koeal = 1/4, koeah = 1/80, 
       kA1 = 1/3, kA2 = 1/75, kM = 1/110)
A = -abs(diag(ks))
A[3, 2] = ks[2] * (98/(3 + 98 + 51))
A[4, 3] = ks[3] * (4/(94 + 4))
A[6, 5] = ks[5] * (24/(6 + 24))
A[7, 6] = ks[6] * (3/(22 + 3))
A[7, 2] = ks[2] * (3/(3 + 98 + 51))
A[4, 1] = ks[1] * (35/(35 + 190 + 30))
A[5, 1] = ks[1] * (30/(35 + 190 + 30))

LI = 150 #Litter inputs
RI = 255 #Root inputs
In=matrix(nrow = 7, ncol = 1, c(RI, LI, 0, 0, 0, 0, 0))

ages=seq(0,200)
  
ga=systemAge(A=A, u=In, a=ages)

plot(ages, ga$systemAgeDensity, type="l")
abline(v=ga$meanSystemAge, lty=2)
legend("topright",c("System Age density",
        paste("Mean system age = ",ga$meanSystemAge)), 
        lty=1:2, bty="n")

pools=c("Roots", "Oi", "Oe/a L", "Oe/a H", "A, LF (>80 um)",
         "A, LF (< 80 um)", "Min. Ass.")
par(mfrow=c(3,2))
for(i in 2:7){
  plot(ages,ga$poolAgeDensity[,i],type="l", main=pools[i], 
       ylab="Probability density", xlab="Age", bty="n")
}
par(mfrow=c(1,1))


}
