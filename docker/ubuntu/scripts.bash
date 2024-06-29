# start and run docker container with ubuntu image
# rub it detached and keep it running

function run() {
    # start docker container
    docker run -d -it --name ubuntu ubuntu

    # get the os version
    docker exec -it ubuntu cat /etc/os-release

    # run bash in the container
    docker exec -it ubuntu bash
}

$1