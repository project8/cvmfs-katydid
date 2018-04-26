#!/bin/bash

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# call the setup script to establish all necessary environment variables
source ${SCRIPT_DIR}/setup.sh

# create the katydid build directory
mkdir -p ${P8KATYDIDDIR}

# copy in the setup and install scripts
cp ${SCRIPT_DIR}/setup.sh ${P8KATYDIDDIR}/setup.sh
cp ${SCRIPT_DIR}/download_pkg.sh ${P8KATYDIDDIR}/download_pkg.sh
cp ${SCRIPT_DIR}/install.sh ${P8KATYDIDDIR}/install.sh

# run the install script
${P8KATYDIDDIR}/download_pkg.sh
${P8KATYDIDDIR}/install.sh
