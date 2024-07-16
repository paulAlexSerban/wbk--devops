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
