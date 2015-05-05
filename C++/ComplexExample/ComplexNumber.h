class ComplexNumber {
	friend bool operator==(const ComplexNumber& a, const ComplexNumber&b);
private:
	double realPart,imagePart;
public:
	ComplexNumber(double r,double i); //constructor
	void print();
};
