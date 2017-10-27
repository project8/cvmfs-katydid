source /cvmfs/hep.pnnl.gov/project8/dependencies/${P8DEPBUILD}/setup.sh

export P8KATYDIDDIR=${P8BASEDIR}/katydid/${KATYDIDBRANCH}

export PATH=${P8KATYDIDDIR}/bin:${PATH}
export INCLUDE_PATH=${P8KATYDIDDIR}/include:${INCLUDE_PATH}
export LIBRARY_PATH=${P8KATYDIDDIR}/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${P8KATYDIDDIR}/lib:${LD_LIBRARY_PATH}
export LIBDIR=${P8KATYDIDDIR}/lib:${LIBDIR}
