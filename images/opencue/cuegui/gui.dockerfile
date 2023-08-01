# Base Docker Image.
FROM nvidia/cudagl:11.4.2-base-centos7
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES},display

# Update the Base Image and install all prerequisites.
RUN yum -y update && \
    yum -y groupinstall "X Window System" "Fonts" && \
    yum -y install wget unzip mesa-libGLU alsa-lib libpng12 SDL && \
    yum -y install xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil libxkbcommon-x11 libgomp && \
    yum -y install openssl openssl-devel

RUN yum -y install \
    git \
    gcc \
    time \
    python3 \
    python3-devel \
    python3-pip

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade setuptools

RUN python3 -m pip install PySide2
# RUN pip install pytest-qt

RUN mkdir /var/tmp/runtime-root && \
    chmod 0700 /var/tmp/runtime-root
ENV XDG_RUNTIME_DIR=/var/tmp/runtime-root

# ----------------------------------------------------------------
# ------------------------------instal cuegui---------------------

ARG OPENCUE_MAJOR=0
ARG OPENCUE_MINOR=21
ARG OPENCUE_PATCH=13
ARG OPENCUE_VERSION=${OPENCUE_MAJOR}.${OPENCUE_MINOR}.${OPENCUE_PATCH}

RUN mkdir -p /usr/local/cuegui/cuegui-${OPENCUE_VERSION}-all

RUN curl -SL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/v${OPENCUE_VERSION}/cuegui-${OPENCUE_VERSION}-all.tar.gz \
        -o cuegui-${OPENCUE_VERSION}-all.tar.gz

RUN tar -xzf cuegui-${OPENCUE_VERSION}-all.tar.gz \
    -C /usr/local/cuegui/cuegui-${OPENCUE_VERSION}-all \
    --strip-components=1

RUN rm cuegui-${OPENCUE_VERSION}-all.tar.gz

WORKDIR /usr/local/cuegui/cuegui-${OPENCUE_VERSION}-all

RUN python3 -m pip install -r requirements.txt && \
    python3 -m pip install -r requirements_gui.txt && \
    python3 setup.py install




