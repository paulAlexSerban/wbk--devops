#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

function build() {
    docker image build -t customnginx:0.1.0 -t customnginx:latest .

    echo "Custom Nginx image built"
    echo "To check the image, use: "
    echo "docker image ls | grep customnginx"
    echo "bash scripts.bash list_images"
}

function run() {
    docker run -d -p 8080:80 customnginx:latest

    echo "Custom Nginx container running, open http://localhost:8080 in your browser"
    echo "To check the running container, use:"
    echo "docker ps | grep customnginx"
    echo "bash scripts.bash list_containers"
}

function list_images() {
    docker image ls | grep customnginx
}

function list_containers() {
    docker ps | grep customnginx
}

$1