#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

IMAGE_NAME="goals-manager-server"
PACKAGE_VERSION=$(node -p -e "require('./package.json').version")
PORT=${PORT}

function help() {
    echo "Available commands:"
    echo "build - build the Docker image"
    echo "run - run the Docker container"
    echo "list_images - list all Docker images"
    echo "list_containers - list all Docker containers"
}

function list_images() {
    docker image ls | grep ${IMAGE_NAME}
}

function list_containers() {
    docker ps | grep ${IMAGE_NAME}
}

function build() {
    docker image build -t ${IMAGE_NAME}:${PACKAGE_VERSION} -t ${IMAGE_NAME}:latest .
    list_images
}

function run() {
    docker run -d -p ${PORT}:80 ${IMAGE_NAME}:latest
    list_containers
    echo "Server listenting to http://localhost:${PORT}"
}

$1
