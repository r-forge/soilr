#touch MCMC.h MCMCTest.h MCMCTest.cpp 
autoreconf --install
#touch NEWS README AUTHORS ChangeLog # To make automake happy
./configure
make check
