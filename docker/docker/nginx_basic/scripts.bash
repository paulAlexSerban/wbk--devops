#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

IMAGE_NAME="custom-nginx"
VERSION=latest
LOCALHOST_PORT=8080
CONTAINR_NAME="custom-nginx"

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
    docker ps | grep ${CONTAINR_NAME}
}

function build() {
    docker image build -t ${IMAGE_NAME}:${VERSION} -t ${IMAGE_NAME}:latest . 
    list_images
}

function run() {
    docker run --name ${CONTAINR_NAME} -d -p ${LOCALHOST_PORT}:80 ${IMAGE_NAME}:latest --name ${CONTAINR_NAME}
    list_containers
    echo "Server listenting to http://localhost:${LOCALHOST_PORT}"
}

function stop() {
    # stop the container
    docker stop ${CONTAINR_NAME}
}

function remove() {
    # remove the container
    docker rm ${CONTAINR_NAME}
    list_containers
}

$1
