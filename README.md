[![Build and Push Multiarch Docker Images](https://github.com/pedrolsazevedo/oci/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/pedrolsazevedo/oci/actions/workflows/ci.yaml)

# OCI Basic Images

Multiarch Docker images with essential development tools for testing and development in isolated environments.

## Architecture Support

All images support both **AMD64** and **ARM64** architectures, including Apple Silicon Macs.

## Available Images

All images include: `curl`, `git`, `vim`, `wget`, `unzip`, `openssl`, DNS tools, `helm`, `kubectl`, `k9s`, `mise`, `terraform`, `terragrunt`

| Image | Base | Docker Hub | Size |
|-------|------|------------|------|
| **Alpine** | `alpine:latest` | `psazevedo/alpine` | ~180MB |
| **Ubuntu** | `ubuntu:24.04` | `psazevedo/ubuntu` | ~350MB |
| **UBI** | `ubi9/ubi:latest` | `psazevedo/ubi` | ~400MB |
| **SUSE** | `opensuse/leap:latest` | `psazevedo/suse` | ~380MB |
| **Node** | `node:alpine` | `psazevedo/node` | ~280MB |
| **Oracle Linux** | `oraclelinux:9` | `psazevedo/oraclelinux` | ~420MB |

## Quick Start

### Using Pre-built Images
```bash
# Alpine shell
docker run -it --rm psazevedo/alpine

# Ubuntu with volume mount
docker run -it --rm -v $(pwd):/workspace psazevedo/ubuntu

# Node.js development
docker run -it --rm -v $(pwd):/app -p 3000:3000 psazevedo/node
```

### Using OCI Script
```bash
# Simple usage
./oci.sh run alpine
./oci.sh run ubuntu -v $(pwd):/workspace
./oci.sh run node -p 3000:3000 -v $(pwd):/app
```

## Local Development

### Build and Run Images
```bash
chmod +x oci.sh
./oci.sh build all          # Build all images
./oci.sh build ubuntu       # Build specific image
./oci.sh run alpine         # Run container shell
```

### OpenSSL Certificate Generation

All images include OpenSSL for certificate operations:

```bash
# Generate private key
openssl genrsa -out private.key 2048

# Generate certificate signing request
openssl req -new -key private.key -out cert.csr

# Generate self-signed certificate
openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes

# View certificate details
openssl x509 -in cert.pem -text -noout

# Test SSL connection
openssl s_client -connect example.com:443
```

## 🔄 Automated Updates

- **Renovate Bot**: Automatically updates base images and GitHub Actions
- **GitHub Actions**: Builds and pushes multiarch images on every commit
- **Version Tagging**: Uses Commitizen for semantic versioning