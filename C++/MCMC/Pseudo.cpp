//#include "particleSet.h"
//int main()
//{	
//	int in=10^9 			//initial number of particles
//	const pp=10^-10 		//percentage of particles to be removed per timestep
//	double  te=0 			//time of entry of in the pool
//	ParticleSet pp,ss;
//	int nt=10^5 			// numberOfTimeSteps
//	pp()
//	pp.addParticles(in,ts)
//	for (int i=0;i<nt,i++){
//	   n=pp.getNumberOfParticles()
//	   ss=pp.getAndRemoveRandomSubsetOfSize(n*pp)
//	   // do some stuff and store it away
//	   ss.computeMeanTransitTimeOfParticles()
//	   pp.computeMeanAgeOfParticles()
//	}
//   
#include "MCSimulatorTest.h"
#include <boost/math/special_functions/expm1.hpp>
#include <iostream>
int main(){
	const int ExampleNumberOfTimesteps = 1000;
	const double StartTime= 0.0;
	const double EndTime= 100.0;
	double TimeStep=(EndTime-StartTime)/ExampleNumberOfTimesteps;
	
	double refres[ExampleNumberOfTimesteps] ;
	for (int i=0;i<ExampleNumberOfTimesteps-1;i++){
		double t =StartTime-double(i)*TimeStep;
		refres[i]=expm1(t)+1;
	}
	for (int i=0;i<ExampleNumberOfTimesteps-1;i++){
		std::cout << refres[i] << " , ";
	}

	// Process
	MCSimulator mcs( ExampleNumberOfTimesteps,StartTime,EndTime );
}
