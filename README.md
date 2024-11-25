# OpenCue Kubernetes Demo

The goal of this project is to provide a good starting point for anyone wanting to get OpenCue up and running in a home lab or small cluster. This project isn't representative of "good practice" for a using in a production environment.

## Prerequisites

This setup assumes the following is already good to go.

1. docker compose
2. a docker registry (extra configuration required if the registry is private and/or insecure)
3. an nfs server

## Get started!

1. configure the environment
2. build images
3. deploy
4. test

## Configure for your environment

In root directory, create an `.env` file with opencue versions, registry server and NFS storage defined. for example...

    OPENCUE_MAJOR=1
    OPENCUE_MINOR=0
    OPENCUE_PATCH=0
    REGISTRY_SERVER=registry_server:443
    NFS_SERVER=nfs_server
    NFS_MOUNT_PATH=/path/to/nfs/remote/dir
    NFS_CONTAINER_PATH=/path/to/mount/in/deployed/pods
    KUBECTL_CMD=kubectl
    RQD_IMAGE=demo_rqd

## build/push the needed images

Follow the steps in [images/README.md](images/README.md)
## deploy manifests

Follow the steps in [manifests/README.md](manifests/README.md)
## test the farm

Follow the steps in [client/README.md](client/README.md)




