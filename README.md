[![Commitizen Bump version](https://github.com/pedrolsazevedo/oci/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/pedrolsazevedo/oci/actions/workflows/ci.yaml)  

# OCI Basic Images
Basic images repository to use when want to test things on a isolated shell.

## Images
All images will be built with curl wget vim bind-tools/dnsutils.

1. **Alpine** (alpine:latest)
2. **Node** (node:alpine)
3. **openSuse** (leap-dnf:latest)
4. **UBI** (ubi9/ubi:latest)
5. **Ubuntu** (ubuntu:latest)
6. **Oracle Linux** (oraclelinux:9)

The images will be built with the tag local/IMAGE_NAME and local/IMAGE_NAME:latest

**Images size**:
```
docker images --format "table \t{{.Repository}}\t{{.Size}}\t{{.Tag}}"
```
```
REPOSITORY          SIZE      TAG
local/oraclelinux   306MB     latest
local/node          182MB     latest
local/ubuntu        198MB     latest
local/ubi           293MB     latest
local/suse          265MB     latest
local/alpine        48.3MB    latest
```


## Build Script
**`oci_build.sh`**
Basic script to build single or all images.
1. Add execution permission for the script
```
sudo chmod +x oci_build.sh
```
2. Run the build command
```
./oci_build.sh all
```

## Alias Suggestion
Some suggestions to keep the shell for the containers in hand when need to use
1. **`.bash_aliases`**
```
alias alpsh='docker run -it --rm local/alpine'
alias ubash='docker run -it --rm local/ubuntu'
alias rhbash='docker run -it --rm local/ubi'
alias susebash='docker run -it --rm local/suse'
alias node='docker run -it --rm -v $(pwd):/app local/node'
alias olbash='docker run -it --rm local/oraclelinux'
```
