bin="hello"
rm -f ${bin}
g++ ComplexNumber.h ComplexNumber.cpp HelloComplex.cpp -o ${bin}
#run the program
./${bin}
