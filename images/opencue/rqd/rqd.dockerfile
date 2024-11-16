FROM nvidia/cuda:12.6.2-base-rockylinux9

ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES},display

RUN yum -y install \
    git \
    gcc \
    time \
    python3 \
    python3-devel \
    python3-pip

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade setuptools

ARG OPENCUE_MAJOR=1
ARG OPENCUE_MINOR=0
ARG OPENCUE_PATCH=0
ARG OPENCUE_VERSION=${OPENCUE_MAJOR}.${OPENCUE_MINOR}.${OPENCUE_PATCH}

WORKDIR /opt/opencue
RUN curl -SL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/v${OPENCUE_VERSION}/rqd-${OPENCUE_VERSION}-all.tar.gz \
        -o rqd.tar.gz

RUN tar -xzf rqd.tar.gz \
    -C . \
    --strip-components=1

RUN python3 -m pip install -r requirements.txt
#RUN python3 -m pip install pynput
RUN rm rqd.tar.gz

RUN python3 setup.py install

# RQD gRPC server
EXPOSE 8444

COPY rqd.conf /etc/opencue/rqd.conf

# NOTE: This shell out is needed to avoid RQD getting PID 0 which leads to leaking child processes.
ENTRYPOINT ["/bin/bash", "-c", "set -e && rqd"]