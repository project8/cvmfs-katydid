#!/bin/bash

# It's assumed that you've already sourced the relevant setup.sh

echo "Environment variables:"
env
echo `which python3`
echo `python3 -V`

echo `gcc --version`
echo `python3 --version`

echo `which cc`
echo `which g++`
echo `which ld`

echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`

# katydid
cd ${P8KATYDIDDIR}/src/Katydid
mkdir build
cd build/
pwd
#cmake -DCMAKE_BUILD_TYPE=Release -DADDTL_LINK_DIRS=${BASEDIR}/lib -DADDTL_INCLUDE_DIRS=${BASEDIR}/include ..  | tee cmake_log.txt
# cmake is run twice to properly set the install prefix
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8KATYDIDDIR} -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True -DCicada_ADD_CICADA_PY=True .. | tee cmake_log.txt
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8KATYDIDDIR} -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True -DCicada_ADD_CICADA_PY=True .. | tee cmake_log.txt
make -j3                                 | tee ${P8KATYDIDDIR}/make_log.txt   # this may be problematic because of a subtle bug in the way LD_LIBRARY_PATH is inherited
make -j3 install                         | tee ${P8KATYDIDDIR}/make_install_log.txt

# Test if Katydid runs
Katydid --help
# python3 -c "import CicadaPy\n CicadaPy.loadLibraries()"

echo "Removing old 'current' soft link"
rm ${P8BASEDIR}/katydid/current
echo "Adding new 'current' soft link"
ln -s ${P8KATYDIDDIR} ${P8BASEDIR}/katydid/current
