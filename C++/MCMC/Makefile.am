# Rules for the test code (use `make check` to execute)
TESTS = MCMCApp PseudoApp
check_PROGRAMS = $(TESTS)
MCMCApp_SOURCES = Particle.h ParticleTest.h ParticleTest.cpp MCSimulatorTest.h MCSimulatorTest.cpp MCMCApp.cpp
MCMCApp_CXXFLAGS = $(CPPUNIT_CFLAGS)
MCMCApp_LDFLAGS = $(CPPUNIT_LIBS) -ldl

PseudoApp_SOURCES = MCSimulatorTest.h MCSimulatorTest.cpp Pseudo.cpp
PseudoApp_CXXFLAGS = $(CPPUNIT_CFLAGS)
PseudoApp_LDFLAGS = $(CPPUNIT_LIBS) -ldl
