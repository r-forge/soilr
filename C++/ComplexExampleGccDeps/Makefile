OBJS := Complex.o HelloComplex.o
BIN="hello.out"
CXX="g++"
#link
$(BIN): $(OBJS)
	$(CXX) $(OBJS) -o $(BIN)
#compile
%.o: %.c
	$(CXX) -c $*.cpp -o $*.o
	$(CXX) -MM $*.cpp > $*.d
#remove intermediate compilation products
clean:
	rm -f $(BIN) *.o
 


