#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

function build() {
    docker image build -t randomgenerator:0.1.0 -t randomgenerator:latest .
    docker image ls | grep randomgenerator
}

function run() {
    build
    docker run -it randomgenerator:latest
}

function clean_system() {
    echo "Disk usage before cleanup:"
    docker system df
    
    echo "Pruning all unused images..."
    docker image prune -a -f
    
    echo "Pruning all stopped containers..."
    docker container prune -f
    
    echo "Pruning all unused volumes..."
    docker volume prune -f
    
    echo "Pruning all unused networks..."
    docker network prune -f
    
    echo "Disk usage after cleanup:"
    docker system df
}

$1