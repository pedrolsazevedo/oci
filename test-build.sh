#!/bin/bash

set -e

IMAGES=(alpine ubuntu ubi suse node oraclelinux openssl)

echo "Testing Docker builds locally..."

# Create buildx builder if it doesn't exist
docker buildx create --name multiarch --use 2>/dev/null || docker buildx use multiarch

for image in "${IMAGES[@]}"; do
    echo "Building $image for AMD64..."
    docker buildx build --platform linux/amd64 -f "./build/Dockerfile.$image" -t "test-$image:amd64" .

    echo "Building $image for ARM64 (emulated)..."
    docker buildx build --platform linux/arm64 -f "./build/Dockerfile.$image" -t "test-$image:arm64" .

    echo "✓ $image multiarch build successful"
done

echo "All multiarch builds completed successfully!"
