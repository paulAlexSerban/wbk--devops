# start and run docker container with centos image
# rub it detached and keep it running

function run() {
    # start docker container
    docker run -d -it --name centos centos

    # get the os version
    docker exec -it centos cat /etc/os-release

    # run bash in the container
    docker exec -it centos bash
}

$1