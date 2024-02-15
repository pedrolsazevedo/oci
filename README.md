# oci
Basic images repository

## Images
All images will be built with curl wget vim bind-tools/dnsutils.

1. **Alpine** (alpine:latest)
2. **Node** (node:alpine)
3. **openSuse** (leap-dnf:latest)
4. **UBI** (ubi9/ubi:latest)
5. **Ubuntu** (ubuntu:latest)
6. **Oracle Linux** (oraclelinux:9)

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

.bash_aliases
