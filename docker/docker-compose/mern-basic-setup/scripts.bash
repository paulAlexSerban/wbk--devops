#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

function help() {
    echo "Usage: $0 <up|up-new|down>"
    echo "up: starts the containers"
    echo "up-new: starts the containers and recreates them"
    echo "down: stops the containers and removes the volumes"
}

if [ -z "$1" ]; then
    help
    exit 1
fi

function up() {
    docker-compose up -d
}

function up-new() {
    docker-compose up -d --force-recreate
}

function down() {
    docker-compose down -v
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
