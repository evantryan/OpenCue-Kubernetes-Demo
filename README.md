# OpenCue Kubernetes Demo

The goal of this project is to provide a good starting point for anyone wanting to get OpenCue up and running in a home lab or small cluster. I'm using `microk8s` for everything, but any cluster administered with `kubectl` will do the trick. This project isn't representative of "good practice" for a using in a production environment.

## Prerequisites

This setup assumes the following is already good to go.

1. docker
2. a docker registry (extra configuration required if the registry is private and/or insecure)
3. an nfs server

## Get started!

1. configure the environment
2. build images
3. deploy
4. test

## Configure for your environment

In root directory, create an `.env` file with opencue versions, registry server, and nuke license server defined. for example...

    OPENCUE_MAJOR=0
    OPENCUE_MINOR=22
    OPENCUE_PATCH=14
    REGISTRY_SERVER=registry_server:443
    NFS_SERVER=fourage
    NFS_MOUNT_PATH=/path/to/nfs/remote/dir
    NFS_CONTAINER_PATH=/path/to/mount/in/deployed/pods
    KUBECTL_CMD=kubectl
    RQD_IMAGE=demo_rqd
    FOUNDRY_NUKE_LIC_HOST=4101@license_server

## build/push the needed images

Follow the steps in [images/README.md](images/README.md)
## deploy manifests

Follow the steps in [manifests/README.md](manifests/README.md)
## test the farm

Follow the steps in [client/README.md](client/README.md)




