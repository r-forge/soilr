#This is a reminder how to use the autotools
autoreconf --install
./configure
make clean
make
#run the program
./src/hello
