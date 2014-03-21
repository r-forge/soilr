#ifndef MCSIMULATORTEST_H
#define MCSIMULATORTEST_H
#include "MCSimulator.h"
#include <cppunit/extensions/HelperMacros.h>
class MCSimulatorTest : public CppUnit::TestFixture
{
CPPUNIT_TEST_SUITE( MCSimulatorTest );
CPPUNIT_TEST( testConstructor );
CPPUNIT_TEST( testResultVector );
CPPUNIT_TEST_SUITE_END();
public:
void setUp();
void tearDown();
void testConstructor();
void testResultVector();
};
#endif // MCSIMULATORTEST_H
