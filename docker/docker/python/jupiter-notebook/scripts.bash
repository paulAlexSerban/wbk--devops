#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

SERVICE_NAME=jupiter-notebook
VERSION=0.1.0

function build() {
    docker image build -t ${SERVICE_NAME}:${VERSION} .
    docker image ls | grep ${SERVICE_NAME}
}

function run() {
    build
    docker run -p 8888:8888 -it -v $(pwd)/notebooks:/opt/notebooks ${SERVICE_NAME}:${VERSION}
}

$1