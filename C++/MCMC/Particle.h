#ifndef MONEY_H
#define MONEY_H
#include <string>
class Particle
{
public:
Particle( double t)
: entryTime( t)
{
}
////////////////////////////////////////
double getEntryTime() const
{
return entryTime;
}
private:
double entryTime;
};
#endif
