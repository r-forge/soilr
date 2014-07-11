#include "MCSimulator.h"
#include <boost/math/special_functions/expm1.hpp>
#include <iostream>
#include <vector>
#include <Rcpp.h>
extern "C" {
        //using namespace Rcpp ;
	SEXP X_main (SEXP params ,SEXP a) {
		Rcpp::List par(params);
		int nt=par[0];
		double f =Rcpp::as<double>(par[1]);
    		Rcpp::NumericVector na  = Rcpp::NumericVector(a);
		std::vector<float> res(nt,100); 
	        //int rc_nt= int(nt);
		//const int ExampleNumberOfTimesteps = 1000;
		//const double StartTime= 0.0;
		//const double EndTime= 100.0;
		//double TimeStep=(EndTime-StartTime)/ExampleNumberOfTimesteps;
		//
		//double refres[ExampleNumberOfTimesteps] ;
		//for (int i=0;i<ExampleNumberOfTimesteps-1;i++){
		//	double t =StartTime-double(i)*TimeStep;
		//	refres[i]=expm1(t)+1;
		//}
		////for (int i=0;i<ExampleNumberOfTimesteps-1;i++){
		////	std::cout << refres[i] << " , ";
		////}
	
		//// Process
		//MCSimulator mcs( ExampleNumberOfTimesteps,StartTime,EndTime );

		Rcpp::CharacterVector x = Rcpp::CharacterVector::create( "foo", "bar" )  ;
    		Rcpp::NumericVector y   = Rcpp::NumericVector::create( 0.0, 1.0 ) ;
    		Rcpp::List z            = Rcpp::List::create( x, y,na,f,nt, Rcpp::wrap(res)) ;
    
    return z ;
	} //main
} // extern "C"
