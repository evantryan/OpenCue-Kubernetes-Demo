ARG REGISTRY_SERVER=registry_server
FROM ${REGISTRY_SERVER}/demo_rqd:latest

RUN dnf -y install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-9.noarch.rpm && \
    dnf  config-manager --set-enabled crb && \
    dnf -y install ffmpeg ffmpeg-devel