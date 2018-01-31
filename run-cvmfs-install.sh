#!/bin/bash

# specify versions of dependencies and katydid
export P8DEPBUILD=build-2017-10-18
export KATYDIDBRANCH=v2.9.1

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create the katydid build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}

# copy in the setup and install scripts
cp ${SCRIPT_DIR}/setup.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh
cp ${SCRIPT_DIR}/install.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh

# setup the environment and run the install script
source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh
/cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh
