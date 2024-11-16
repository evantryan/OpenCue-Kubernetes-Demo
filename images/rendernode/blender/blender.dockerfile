ARG REGISTRY_SERVER=registry_server
FROM ${REGISTRY_SERVER}/demo_rqd:latest

RUN yum -y update
RUN yum -y install \
     xz \
     bzip2 \
     libXi-devel  \
     mesa-libGLU-devel \
     zlib-devel \
     libXinerama-devel \
     libXrandr-devel \
     libXext libSM libXrender

ARG BLENDER_MAJOR=3
ARG BLENDER_MINOR=3
ARG BLENDER_PATCH=6
ARG BLENDER_VERSION=${BLENDER_MAJOR}.${BLENDER_MINOR}.${BLENDER_PATCH}


RUN mkdir -p /usr/local/blender/blender-${BLENDER_VERSION}-linux-x64

RUN curl -SL https://download.blender.org/release/Blender${BLENDER_MAJOR}.${BLENDER_MINOR}/blender-${BLENDER_VERSION}-linux-x64.tar.xz \
-o blender-${BLENDER_VERSION}-linux-x64.tar.xz

RUN tar -xf blender-${BLENDER_VERSION}-linux-x64.tar.xz \
        -C /usr/local/blender/blender-${BLENDER_VERSION}-linux-x64 \
        --strip-components=1

RUN rm blender-${BLENDER_VERSION}-linux-x64.tar.xz