# Project 8 CVMFS Katydid installation

## Testing a release branch

1. Set the appropriate Katydid branch or tag in Dockerfile (environment variable `KATYDIDBRANCH`):
1. Set the branch to `release/[version]`:
    1. Uncomment the `ENV KATYDIDBRANCH=release/[version]` line
    1. Comment out the line that uses a tag, `ENV KATYDIDBRANCH=v[version]`
1. If using a new version of the `cvmfs-dependencies` base image, update that in the `FROM` line in Dockerfile
1. Build the container locally
1. If the build works, go ahead with the Katydid release, but don't push these changes to Ladybug:master

## Updating Katydid with a new tagged release

1. Set the appropriate Katydid branch or tag in Dockerfile (environment variable `KATYDIDBRANCH`):
1. Set the branch to the tag name, `v[version]`:
    1. Comment out the `ENV KATYDIDBRANCH=release/[version]` line
    1. Uncomment the line that uses a tag, `ENV KATYDIDBRANCH=v[version]`
1. If using a new version of the `cvmfs-dependencies` base image, update that in the `FROM` line in Dockerfile
1. Build the container locally
1. If the build works, push these changes to Ladybug:master
1. On the Docker Hub page for the `project8/cvmfs-katydid` image, go to Build Settings
1. Trigger a rebuild of both containers (`latest` and same-as-tag)
1. Make sure that the Docker Hub build works
1. If the build works, notify the DIRAC team that Katydid needs to be pushed to CVMFS, and provide the Katydid tag name.
