#include "MCSimulatorTest.h"
#include <boost/math/special_functions/expm1.hpp>
#include <iostream>
// Registers the fixture into the 'registry'
CPPUNIT_TEST_SUITE_REGISTRATION( MCSimulatorTest );
///////////////////////////////////////////////////////////////////////////////////////////////

void
MCSimulatorTest::setUp()
{
}
///////////////////////////////////////////////////////////////////////////////////////////////

void
MCSimulatorTest::tearDown()
{
}
///////////////////////////////////////////////////////////////////////////////////////////////

void
MCSimulatorTest::testConstructor()
{
	// Set up
	const int ExampleNumberOfTimesteps = 12345;
	const double StartTime= 0.0;
	const double EndTime= 1.0;
	// Process
	MCSimulator mcs( ExampleNumberOfTimesteps,StartTime,EndTime);
	// Check
	CPPUNIT_ASSERT_EQUAL( ExampleNumberOfTimesteps, mcs.getNumberOfTimeSteps() );
	CPPUNIT_ASSERT_EQUAL( StartTime, mcs.getStartTime() );
	CPPUNIT_ASSERT_EQUAL( EndTime, mcs.getEndTime() );
}
/////////////////////////////////////////////////////////////////////////////////////////////////

void
MCSimulatorTest::testResultVector()
{
	// Set up
	const int ExampleNumberOfTimesteps = 1000;
	const double StartTime= 0.0;
	const double EndTime= 100.0;
	double TimeStep=(EndTime-StartTime)/ExampleNumberOfTimesteps;
	
	double refres[ExampleNumberOfTimesteps] ;
	for (int i=0;i<ExampleNumberOfTimesteps-1;i++){
		double t =StartTime-double(i)*TimeStep;
		refres[i]=expm1(t)+1;
	}
	for (int i=0;i<ExampleNumberOfTimesteps-1;i++){
		std::cout << refres[i] << " , ";
	}

	// Process
	MCSimulator mcs( ExampleNumberOfTimesteps,StartTime,EndTime );
	// Check
	//CPPUNIT_ASSERT_EQUAL( , mcs.getResultVector() );
}
