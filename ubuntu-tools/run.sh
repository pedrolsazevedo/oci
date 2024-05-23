#!/bin/bash

IMAGE_NAME="ubuntu-tools"
DEFAULT_CONTAINER_NAME="ubuntu-tools"
FORCE_BUILD=0
CONTAINER_NAME=""

while getopts "fn:" opt; do
  case $opt in
    f)
      FORCE_BUILD=1
      ;;
    n)
      CONTAINER_NAME=$OPTARG
      ;;
    *)
      echo "Usage: $0 [-f] [-n container_name]"
      echo "  -f                Force rebuild of the Docker image"
      echo "  -n container_name Specify the container name (optional)"
      exit 1
      ;;
  esac
done

if [ -z "$CONTAINER_NAME" ]; then
  CONTAINER_NAME=$DEFAULT_CONTAINER_NAME
fi

image_exists() {
  docker image inspect $IMAGE_NAME > /dev/null 2>&1
  return $?
}

build_image() {
  echo "Building Docker image $IMAGE_NAME..."
  docker build -t $IMAGE_NAME .
}

if [ $FORCE_BUILD -eq 1 ] || ! image_exists; then
  build_image
fi

echo "Running Docker container $CONTAINER_NAME..."
docker run --rm \
  --name $CONTAINER_NAME \
  --tty \
  --interactive \
  -v $(pwd):/workdir \
  --hostname $CONTAINER_NAME \
  $IMAGE_NAME
