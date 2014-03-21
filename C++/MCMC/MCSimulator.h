#ifndef MCSIMULATOR_H
#define MCSIMULATOR_H
#include <string>
class MCSimulator
{
public:
MCSimulator( int np,double st,double et)
: NumberOfTimeSteps( np),StartTime(st),EndTime(et)
{
}
////////////////////////////////////////
int getNumberOfTimeSteps() const
{
return NumberOfTimeSteps;
}
//////////////////////////////////////////
double getStartTime() const
{
return StartTime;
}
//////////////////////////////////////////
double getEndTime() const
{
return EndTime;
}
//////////////////////////////////////////
private:
int NumberOfTimeSteps;
double StartTime;
double EndTime;
};
#endif
