FROM project8/cvmfs-dependencies:build-2017-10-18

#ENV KATYDIDBRANCH=release/2.7.2
ENV KATYDIDBRANCH=v2.7.2

RUN mkdir -p /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH} && \
    rm -f /cvmfs/hep.pnnl.gov/project8/katydid/latest && \
    ln -s /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH} /cvmfs/hep.pnnl.gov/project8/katydid/latest

ADD ./setup.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh
ADD ./install.sh /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh

# sleep for 1s added to avoid weird "text file busy" error when building on docker hub
RUN source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh && \
    chmod +x /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh && \
    sleep 1s && \
    /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/install.sh
