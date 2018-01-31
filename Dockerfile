FROM project8/cvmfs-dependencies-katydid:build-2017-10-18

ENV KATYDIDBRANCH=v2.9.1

RUN mkdir -p /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}

ADD ./setup.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh
ADD ./install.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh

# sleep for 1s added to avoid weird "text file busy" error when building on docker hub
RUN source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh && \
    /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh
