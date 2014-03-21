#ifndef PARTICLETEST_H
#define PARTICLETEST_H
#include "Particle.h"
#include <cppunit/extensions/HelperMacros.h>
class ParticleTest : public CppUnit::TestFixture
{
CPPUNIT_TEST_SUITE( ParticleTest );
CPPUNIT_TEST( testConstructor );
CPPUNIT_TEST_SUITE_END();
public:
void setUp();
void tearDown();
void testConstructor();
};
#endif // PARTICLETEST_H
