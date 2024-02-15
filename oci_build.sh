#!/bin/bash

# Function to display help information
display_help() {
  echo "Usage: ./build_images.sh [all | alpine | suse | ubi | ubuntu | node]"
  echo ""
  echo "Build Docker images for different Linux distributions."
  echo ""
  echo "Options:"
  echo "  all      Build all images"
  echo "  alpine   Build Alpine Linux image"
  echo "  suse     Build SUSE Linux image"
  echo "  ubi      Build Red Hat Universal Base Image (UBI) image"
  echo "  ubuntu   Build Ubuntu Linux image"
  echo "  node     Build Node.js image"
  echo "  ol       Build Oracle Linux image"
  echo ""
  echo "Examples:"
  echo "  ./build_images.sh all"
  echo "  ./build_images.sh alpine"
  echo "  ./build_images.sh ubuntu"
}

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
  display_help
  exit 0
fi

build_image() {
  image_name=$1
  dockerfile=$2
  echo "Building $image_name image"
  echo "--------------------------"
  docker build -t local/"$image_name":latest -t local/"$image_name" -f "$dockerfile" .
}

if [ "$1" == "all" ]; then
  build_image "alpine" "build/Dockerfile.alpine"
  build_image "suse" "build/Dockerfile.suse"
  build_image "ubi" "build/Dockerfile.ubi"
  build_image "ubuntu" "build/Dockerfile.ubuntu"
  build_image "node" "build/Dockerfile.node"
  build_image "oraclelinux" "build/Dockerfile.oraclelinux"
else
  case $1 in
  "alpine")
    build_image "alpine" "build/Dockerfile.alpine"
    ;;
  "suse")
    build_image "suse" "build/Dockerfile.suse"
    ;;
  "ubi")
    build_image "ubi" "build/Dockerfile.ubi"
    ;;
  "ubuntu")
    build_image "ubuntu" "build/Dockerfile.ubuntu"
    ;;
  "node")
    build_image "node" "build/Dockerfile.node"
    ;;
  "ol")
    build_image "oraclelinux" "build/Dockerfile.oraclelinux"
    ;;
  *)
    echo "Invalid argument: $1"
    echo ""
    display_help
    exit 1
    ;;
  esac
fi