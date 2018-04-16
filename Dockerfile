FROM project8/cvmfs-dependencies-katydid:build-2018-04-12

RUN mkdir -p /tmp_install

COPY ./setup.sh /tmp_install/setup.sh
COPY ./download_pkg.sh /tmp_install/download_pkg.sh
COPY ./install.sh /tmp_install/install.sh
COPY ./run-cvmfs-install.sh /tmp_install/run-cvmfs-install.sh

# sleep for 1s added to avoid weird "text file busy" error when building on docker hub
RUN cd /tmp_install && \
    ls && \
    source /tmp_install/run-cvmfs-install.sh && \
    rm -rf /tmp_install
