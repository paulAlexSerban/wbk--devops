#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

docker run -it randomgenerator:latest
docker ps | grep randomgenerator