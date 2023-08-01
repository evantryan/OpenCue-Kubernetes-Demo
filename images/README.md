# Building and pushing images

## opencue images

to get the demo up and running with just the basic submit examples, the opencue images are all that is needed. The RQD image starts from `nvidia/cuda` so, DCC apps can take advantage of GPU if they have that capability.

    docker compose --env-file ../.env -f docker-compose-opencue.yml build --push

Note: I found that I had to copy in [`/etc/opencue/rqd.conf`](opencue/rqd/rqd.conf) to the base rqd image to get jobs to pick up. Something to do with the way permissions are set up?

## render node images

All of the render node images inherit from demo_rqd:latest. These are only needed if you want to test nuke, blender, ffmpeg jobs.

    docker compose --env-file ../.env -f docker-compose-rendernodes.yml build --push

to build and push only a specific image. Blender, for example

    docker compose --env-file ../.env -f docker-compose-rendernodes.yml build blender_rqd --push

## to build and push everything

    ./build_and_push_all.sh

