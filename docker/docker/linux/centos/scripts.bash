#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

IMAGE_NAME="centos"
CONTAINR_NAME="centos"
PACKAGE_VERSION=latest

function run() {
    # start docker container
    docker run -d -it --name ${CONTAINR_NAME} ${IMAGE_NAME}:${PACKAGE_VERSION}

    # get the os version
    docker exec -it ${CONTAINR_NAME} cat /etc/os-release

    # run bash in the container
    docker exec -it ${CONTAINR_NAME} bash
}

function stop() {
    # stop the container
    docker stop ${CONTAINR_NAME}
}

function remove() {
    # remove the container
    docker rm ${CONTAINR_NAME}
}

$1
