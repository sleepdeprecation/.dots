if [[ -d ~/.colima ]]; then
    export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
fi

function docker-clean-images() {
    images_to_remove=$(docker images -q -f dangling=true)

    echo "$images_to_remove" | while IFS= read -r image; do
        echo "clean $image"
        docker rmi "$image"
    done
}

function docker-clean-containers() {
    containers_to_stop=$(docker ps -a -q -f status=created -f status=exited)

    echo "$containers_to_stop" | while IFS= read -r container; do
        docker rm "$container"
    done
}

function docker-clean() {
    docker-clean-containers
    docker-clean-images
}
