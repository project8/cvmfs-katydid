#!/bin/bash

# specify versions of dependencies and katydid
export P8DEPBUILD=build-2018-04-12
export KATYDIDBRANCH=v2.10.1.1

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create the katydid build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}

# copy in the setup and install scripts
cp ${SCRIPT_DIR}/setup.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh
cp ${SCRIPT_DIR}/download_pkg.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/download_pkg.sh
cp ${SCRIPT_DIR}/install.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh

# setup the environment and run the install script
source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/download_pkg.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh
/cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/download_pkg.sh
/cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh
