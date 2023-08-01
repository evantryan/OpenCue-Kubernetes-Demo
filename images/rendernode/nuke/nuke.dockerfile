ARG REGISTRY_SERVER=registry_server
FROM ${REGISTRY_SERVER}/demo_rqd:latest

# Update the Base Image and install all prerequisites.
RUN yum -y install \
        xorg-x11-server-Xvfb \
        xorg-x11-server-utils \
        alsa-lib \
        mesa-libGLU \
        unzip \
        gettext \
        sudo \
        libXv \
        nss \
        fontconfig \
        libXcomposite \
        libXdamage libXtst libglvnd-egl

# Set the Nuke environment variables.
ARG NUKE_MAJOR=13
ARG NUKE_MINOR=2
ARG NUKE_PATCH=4

ENV NUKE_MAJOR=${NUKE_MAJOR}
ENV NUKE_MINOR=${NUKE_MINOR}
ENV NUKE_PATCH=${NUKE_PATCH}
ENV NUKE_VERSION=${NUKE_MAJOR}.${NUKE_MINOR}v${NUKE_PATCH}

# creates working directories and user nuke
RUN mkdir -p /usr/local/Nuke${NUKE_VERSION} && mkdir -p /usr/local/foundry/FLEXlm

RUN curl -SL https://thefoundry.s3.amazonaws.com/products/nuke/releases/${NUKE_VERSION}/Nuke${NUKE_VERSION}-linux-x86_64.tgz \ 
        -o /tmp/Nuke${NUKE_VERSION}-linux-x86_64.tgz

RUN tar -C /tmp -xvzf /tmp/Nuke${NUKE_VERSION}-linux-x86_64.tgz
RUN /tmp/Nuke${NUKE_VERSION}-linux-x86_64.run --accept-foundry-eula --prefix=/usr/local/Nuke${NUKE_VERSION} --exclude-subdir
RUN rm -vf /tmp/*

RUN ln -s /usr/local/Nuke${NUKE_VERSION}/Nuke${NUKE_MAJOR}.${NUKE_MINOR} /usr/local/bin/Nuke
RUN ln -s /usr/local/Nuke${NUKE_VERSION}/Nuke${NUKE_MAJOR}.${NUKE_MINOR} /usr/local/bin/Nuke${NUKE_MAJOR}.${NUKE_MINOR}

ENV PATH=${PATH}:/usr/local/Nuke${NUKE_VERSION}
ENV PYTHON_PATH=/usr/local/Nuke${NUKE_VERSION}

EXPOSE 4101

ARG foundry_LICENSE=license_port_and_host
ENV foundry_LICENSE=${foundry_LICENSE}

# Avoid warning about this variable not set, the path is its default value
RUN mkdir /var/tmp/runtime-root && \
    chmod 0700 /var/tmp/runtime-root
ENV XDG_RUNTIME_DIR=/var/tmp/runtime-root

# Set additional ENV's for Nuke
ENV NUKE_DISK_CACHE /tmp/nuke
ENV NUKE_PYTHON=/usr/local/Nuke${NUKE_VERSION}/py

