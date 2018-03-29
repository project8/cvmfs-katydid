#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh

########################################################################
#
# collect source distributions for all packages
#
########################################################################

# get into the parent directory for all the source code and build proucts
cd ${P8KATYDIDDIR}
mkdir src
cd src/
pwd


# download current (on 2015/09/16) versions of all dependencies
echo "Downloading source files"
wget --input-file=${P8KATYDIDDIR}/package_urls.txt --output-file=wget_log.txt --tries=3
echo "Download: complete!"
cat wget_log.txt
ls

unzip master.zip      # katydid
ln -s katydid-master katydid
