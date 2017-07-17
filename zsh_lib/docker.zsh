function docker-clean-images() {
    images_to_remove=$(docker images -q -f dangling=true)

    if [[ "${images_to_remove}x" != "x" ]]; then
        docker rmi $images_to_remove
    fi
}

function docker-clean-containers() {
    containers_to_stop=$(docker ps -a -q -f status=created -f status=exited)

    if [[ "${containers_to_stop}x" != "x" ]]; then
        docker rm "$containers_to_stop" 
    fi
}

function docker-clean() {
    docker-clean-containers
    docker-clean-images
}
