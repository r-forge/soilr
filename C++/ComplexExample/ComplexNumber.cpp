#include "ComplexNumber.h" 
#include <iostream> // Stream declarations
using namespace std;
ComplexNumber::ComplexNumber(double r, double i) :realPart(r), imagePart(i){ } 
//ComplexNumber::ComplexNumber(double r, double i) {
//	realPart=r;
//	imagePart=i;
//}
void ComplexNumber::print(){
	cout << "My real part is:"
	<< realPart  << endl 
	<<"My imaginary part is:"
	<< imagePart << endl; 
}
bool operator== (const ComplexNumber& a, const ComplexNumber& b){
	cout << "this is == for complex Numbers";
	return (a.realPart==b.realPart)&&(a.imagePart==b.imagePart);
}
