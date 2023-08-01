# Environnment Detail

## opencue version

At the writing of this, the most recent release of opencue was 0.22.14.

## registry server

The registry server is the url to the server you'll use to push images to and deploy images from.

## nfs server

`NFS_SERVER` is the hostname for the nfs server you want to use for the demo


    NFS_SERVER=fourage
    NFS_MOUNT_PATH=/path/to/nfs/remote/dir
    NFS_CONTAINER_PATH=/path/to/mount/in/deployed/pods
    KUBECTL_CMD=kubectl
    RQD_IMAGE=demo_rqd
    FOUNDRY_NUKE_LIC_HOST=4101@license_server