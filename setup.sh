# specify versions of dependencies and katydid
export P8DEPKATYDIDBUILD=build-2018-04-23
export KATYDIDBUILD=v2.14.0

source /cvmfs/hep.pnnl.gov/project8/dependencies-katydid/${P8DEPKATYDIDBUILD}/setup.sh

export P8KATYDIDDIR=${P8BASEDIR}/katydid/${KATYDIDBUILD}

export PATH=${P8KATYDIDDIR}/bin:${PATH}
export INCLUDE_PATH=${P8KATYDIDDIR}/include:${INCLUDE_PATH}
export LIBRARY_PATH=${P8KATYDIDDIR}/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${P8KATYDIDDIR}/lib:${LD_LIBRARY_PATH}
export LIBDIR=${P8KATYDIDDIR}/lib:${LIBDIR}
