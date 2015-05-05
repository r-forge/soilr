#include "Complex.h" 
#include <iostream> // Stream declarations
using namespace std;
Complex::Complex(double r, double i)
	:rp(r), ip(i){
}
void Complex::print(){
	cout << "My real part is:"
	<< rp  << endl 
	<<"My imaginary part is:"
	<< ip  << endl; 
}

