#!/bin/bash
# helpers ###################################

function line {
   for i in $(seq 50)
   do 
	echo -n "#"
   done
   echo "#" 
}

# main ###################################

trunks=$(echo *.cpp)
for t in ${trunks}
do 
 bin=${t%cpp}out
 line
 echo ${t}
 rm ${bin} #remove old executable
 g++ ${t} -o ${bin} #build it
 ./${bin} #run it
done
