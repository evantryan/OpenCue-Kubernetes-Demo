# Building and pushing images

## opencue images

to get the demo up and running with just the basic submit examples, the opencue images are all that is needed. The RQD image starts from `nvidia/cuda` so, DCC apps can take advantage of GPU if they have that capability.

    docker compose --env-file ../.env -f docker-compose-opencue.yml build
    docker compose --env-file ../.env -f docker-compose-opencue.yml push

## render node images

All of the render node images inherit from demo_rqd:latest. These are only needed if you want to test nuke, blender, ffmpeg jobs.

    docker compose --env-file ../.env -f docker-compose-rendernodes.yml build
    docker compose --env-file ../.env -f docker-compose-rendernodes.yml push

to only build and push the blender rqd image

    docker compose --env-file ../.env -f docker-compose-rendernodes.yml build blender_rqd
    docker compose --env-file ../.env -f docker-compose-rendernodes.yml push blender_rqd

## to build and push everything

    ./build_and_push_all.sh

