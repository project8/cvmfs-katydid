#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh

echo "Environment variables:"
env
echo `which python`
echo `python -V`

echo `gcc --version`
echo `python --version`

echo `which cc`
echo `which g++`
echo `which ld`

echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`

# hack: remove /usr/lib64/libhdf5*
rm /usr/lib64/libhdf5*

# katydid
cd /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/src/Katydid
mkdir build
cd build/
#cmake -DCMAKE_BUILD_TYPE=Release -DADDTL_LINK_DIRS=${BASEDIR}/lib -DADDTL_INCLUDE_DIRS=${BASEDIR}/include ..  | tee cmake_log.txt
# cmake is run twice to properly set the install prefix
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8KATYDIDDIR} -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True .. | tee cmake_log.txt
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8KATYDIDDIR} -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True .. | tee cmake_log.txt
make -j3                                 | tee ${P8KATYDIDDIR}/make_log.txt   # this may be problematic because of a subtle bug in the way LD_LIBRARY_PATH is inherited
make -j3 install                         | tee ${P8KATYDIDDIR}/make_install_log.txt

# Test if Katydid runs
Katydid --help

cd ../../..
rm -rf src
