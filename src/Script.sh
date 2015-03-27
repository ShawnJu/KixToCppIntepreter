#!/bin/bash
PWD=`pwd`

#check for junk
set +e
echo "Object files inappropriately committed: `ls -l *.o | wc -l` "
set -e

#check for decent dependencies in makefile.
make clean
rm -f *.o

make regex.o
rm -f regex.o
make regex_tests.cpp
rm -f regex_tests.cpp 
make regex_tests

make scanner.o
rm -f scanner.o
make scanner_tests.cpp
rm -f scanner_tests.cpp
make scanner_tests

make i1_assessment_tests

#check that it runs without errors
./regex_tests	
./scanner_tests
./i1_assessment_tests


echo "Done testing"