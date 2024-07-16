#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

IMAGE_NAME=$(node -p -e "require('./package.json').name")
CONTAINER_NAME=${IMAGE_NAME} 

PACKAGE_VERSION=$(node -p -e "require('./package.json').version")

HOST_PORT=8080
CONTAINER_PORT=5000

function help() {
    echo "Available commands:"
    echo "build - build the Docker image"
    echo "run - run the Docker container"
    echo "list_images - list all Docker images"
    echo "list_containers - list all Docker containers"
    echo "stop - stop the Docker container"
    echo "remove - remove the Docker container"
}

function list_images() {
    docker image ls | grep ${IMAGE_NAME}
}

function list_containers() {
    docker ps | grep ${CONTAINER_NAME}
}

function build() {
    docker image build --tag ${IMAGE_NAME}:${PACKAGE_VERSION} --tag ${IMAGE_NAME}:latest . \
                       --build-arg CONTAINER_PORT=${CONTAINER_PORT}
    list_images
}

function stop() {
    # stop the container
    docker stop ${CONTAINER_NAME}
}

function remove() {
    # remove the container
    docker rm ${CONTAINER_NAME}
    list_containers
}

function run() {
    stop
    remove
    docker run --detach --name ${CONTAINER_NAME} \
               --port ${HOST_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}:latest
    list_containers
    echo "Server listening to http://localhost:${HOST_PORT}"  # Fixed message to use HOST_PORT
}

$1 && echo "Done" || echo "Failed"
