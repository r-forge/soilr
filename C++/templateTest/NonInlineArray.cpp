#include "require.h"
#include <iostream>
using namespace std;
//declare the template
template<class T>
class Array {
  enum { size = 100 };
  T A[size];
public:
  T& operator[](int index); //not implemented yes
};
//implement the operator
template<class T>
T& Array<T>::operator[](int index) {  //now the operator is implemented
    require(index >= 0 && index < size,
      "Index out of range");
    return A[index];
}

int main() {
  Array<int> ia; //use template for ints
  Array<float> fa; //use template for floats
  for(int i = 0; i < 20; i++) {
    ia[i] = i * i;
    fa[i] = float(i) * 1.414;
  }
  for(int j = 0; j < 20; j++)
    cout << j << ": " << ia[j]
         << ", " << fa[j] << endl;
} ///:~
