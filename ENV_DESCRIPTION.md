# Environnment Description

## opencue version

This is split into `OPENCUE_MAJOR`, `OPENCUE_MINOR`, `OPENCUE_PATH`. right now the latest version is 0.22.14 so the values would be 0, 22, and 14 respectively.

## registry server

`REGISTRY_SERVER` is the url to the server you'll use to push images to and deploy images from.

for example, `registry.hub.docker.com/library` or leave blank if you are using dockerhub or `your_registry_host_name`.

## nfs server

`NFS_SERVER` is the hostname for the nfs server you want to use for the demo.
`NFS_MOUNT_PATH` is the path on the server that is exported. you can get a list of exports with `showmount -e $NFS_SERVER`.
`NFS_CONTAINER_PATH` is the path in inside pods. for example, `/projects/shows/testing/`.

## kubectl command
    
`KUBECTL_CMD` is however you call `kubectl`. If you are using something like microk8s, the value here would be `microk8s kubectl` if you haven't already aliased it.

## RQD image name

`RQD_IMAGE` is the name of the image you want to test. Use `demo_rqd` here if you only built the opencue images. If you built the 'rendernode' images, other options are `demo_blender` and `demo_ffmpeg`.