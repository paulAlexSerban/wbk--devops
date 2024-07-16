#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

function up() {
    echo "Starting the MongoDB cluster"
    docker-compose up -d
    echo "The cluster is started"
}

function down() {
    echo "Stopping the MongoDB cluster"
    docker-compose down -v
    echo "The cluster is stopped - data was deleted"
}

$1