aclocal 
autoconf -I/usr/include/libmodplug
automake -a
./configure
make check
