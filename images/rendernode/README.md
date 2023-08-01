# rqd images

to build any one of the rqd type images in this directory's sub directories...

    docker compose build

`demo_rqd` is the base image for all the others. after building it it needs to be pushed so the others can use it

    docker compose push

to troubleshoot failed builds using intermediate containers...

    DOCKER_BUILDKIT=0 docker compose build
    docker run --rm -it <last_working_layer_id> bash



