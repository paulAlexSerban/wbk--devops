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

$1
