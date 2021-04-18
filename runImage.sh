#*************************************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                                    #
# Purpose: To run and exec /bin/bash in docker image.                                             #
# Version: 1.0                                                                                    #
# Licence: MIT                                                                                    #
#*************************************************************************************************#

#!/bin/bash

if ! docker -v &> /dev/null
then
    echo "Docker is not found!"
    echo "WSL: Install and/or run Docker Desktop from https://www.docker.com/products/docker-desktop"
    echo "Ubuntu standalone: use sudo apt-get install docker"
    exit -1
fi

IMAGE_TAG_NAME="nemuuser/rpi-pico-build-env:latest"
echo "IMAGE_TAG_NAME=$IMAGE_TAG_NAME"

if [[ "$(! docker images -q $IMAGE_TAG_NAME 2> /dev/null)" == "" ]];
then
    echo "Docker image $IMAGE_TAG_NAME does not exist! Run buildImage.sh first!"
    exit -1
fi

CURRENT_DIR=$(pwd)
echo "CURRENT_DIR=$CURRENT_DIR"
WORKSPACE_DIR="$(dirname "$CURRENT_DIR")"
echo "WORKSPACE_DIR=$WORKSPACE_DIR"

(set -x; docker \
    run \
    --rm \
    -ti \
    -e TERM=xterm-256color \
    -p 5000:80 \
    -v $WORKSPACE_DIR:/workspace \
    $IMAGE_TAG_NAME \
    /bin/bash -l)

exit 0
