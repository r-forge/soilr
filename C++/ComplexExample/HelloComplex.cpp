#include <iostream> // Stream declarations
#include "ComplexNumber.h" 
using namespace std;

int main() {
	ComplexNumber a(2.9,2.0);
	a.print();
	ComplexNumber b(2.9,2.0);
	a.print();
	b.print();
	bool res=(&a==&b);
	cout << "The result of the comparison is:"<<res <<"\n";
	ComplexNumber *c=new ComplexNumber(2.9,2.0);
	(*c).print();
	res=(&a==c);
	cout << "The result of the comparison is:"<<res <<"\n";
}
