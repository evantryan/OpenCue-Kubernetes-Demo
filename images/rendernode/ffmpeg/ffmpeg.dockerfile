ARG REGISTRY_SERVER=registry_server
FROM ${REGISTRY_SERVER}/demo_rqd:latest

RUN dnf -y install https://download.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN yum install yum-utils -y
RUN yum-config-manager --enable powertools

RUN dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm -y
RUN dnf install --nogpgcheck https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm -y

RUN dnf install ffmpeg ffmpeg-devel -y