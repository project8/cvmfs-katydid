FROM project8/cvmfs-dependencies-katydid:build-2018-03-15

ENV KATYDIDBRANCH=v2.10.0

RUN mkdir -p /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}

COPY ./setup.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh
COPY ./download_pkg.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/download_pkg.sh
COPY ./install.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh

# sleep for 1s added to avoid weird "text file busy" error when building on docker hub
RUN source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh && \
    source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/download_pkg.sh && \
    /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh
