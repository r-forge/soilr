#!/bin/bash
while true
do 
   if [ $sd/TwoCourse.Rnw -nt SoilR_1.0-6.tar.gz ];
      then R CMD build pkg
   fi
   sleep 1
done
