#!/bin/bash

# specify versions of dependencies and katydid
export P8DEPBUILD=build-2017-10-18
export KATYDIDBRANCH=v2.7.2

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create the katydid build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}
rm -f /cvmfs/hep.pnnl.gov/project8/katydid/latest
ln -s /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH} /cvmfs/hep.pnnl.gov/project8/katydid/latest

# copy in the setup and install scripts
cp ${SCRIPT_DIR}/setup.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh
cp ${SCRIPT_DIR}/install.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh

# sleep for 1s added to avoid weird "text file busy" error when building on docker hub
source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh
/cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh
