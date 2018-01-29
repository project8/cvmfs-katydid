# Project 8 CVMFS Katydid

This repository can be used in two ways:

1. To install on the actual CVMFS system, use the `run-cvmfs-install.sh` script
1. To use the docker mockup CVMFS system, use the Dockerfile

When updating the katydid build on GitHub, please make sure that both `run-cvmfs-install.sh` and `Dockerfile` get updated.  
When a new official build is ready, tag it with the build name (the same as the build directory)

## Information

This repository provides the Katydid installation on the CVMFS system used on the PNNL HEP cluster.

It's based on the CVMFS Katydid dependencies (https://hub.docker.com/r/pproject8/cvmfs-dependencies-katydid).

Project 8 software is installed in the `/cvmfs/hep.pnnl.gov/project8` directory.  From there, installed releases go in the `katydid` subdirectory.  
For any images based on this image, their software should go in their own directories to avoid issues with directory names that change as builds are updated.  
For example:

```
/cvmfs/hep.pnnl.gov/project8
   |
   +- dependencies-common
   |
   +- dependencies-katydid
   |
   +- dependencies-morpho
   |
   +- katydid
   |     |
   |     +- v2.7.2
   |           |
   |           +- bin, lib, include, . . .
   |
   +- morpho
   . . .
```

## Installing on the actual CVMFS system

1. Clone the `cmvfs-katydid` repo
1. Make sure the dependency build version in `run-cvmfs-install.sh` (variable `P8DEPBUILD`) is set correctly
1. Execute `run-cvmfs-install.sh`

## Using the Docker mockup of the CVMFS system

1. Clone the `cmvfs-katydid` repo
1. Make sure the katydid version in `Dockerfile` and `setup.sh` (variable `P8DEPBUILD`) is set correctly
1. Execute `docker build -t project8/cvmfs-katydid .`

### Updating a dependency

Your situation: There's a new version of a dependency (e.g. boost) out that we need to use for one of our packages.  Here's how to update this image with the new dependency information and rebuild the container.

1. Update the Katydid version in Dockerfile, setup.sh and run-cvmfs-install.sh (environment variable `P8DEPBUILD`)
1. Test the build locally
1. If the build works, push the changes to the CVMFS-katydid repo
1. On the Docker Hub page for the `project8/cvmfs-katydid` image, go to Build Settings
1. Update the date in the Docker Tag Name column of the second container build
1. Trigger a rebuild of both containers (`latest` and `vx.y.z`)
1. If the rebuild works, and the rebuild of anything that depends on this image works, notify the DIRAC team of the changes that need to be pushed to CVMFS, providing them with the appropriate tag name
1. Proceed with updating any downstream images that use the `cvmfs-katydid` image

