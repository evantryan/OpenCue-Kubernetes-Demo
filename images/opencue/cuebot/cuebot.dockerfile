FROM rockylinux:9-minimal

RUN microdnf install -y java-17-openjdk

ARG CUEBOT_GRPC_CUE_PORT=8443
ARG CUEBOT_GRPC_RQD_PORT=8444

ARG OPENCUE_MAJOR=1
ARG OPENCUE_MINOR=0
ARG OPENCUE_PATCH=0
ARG OPENCUE_VERSION=${OPENCUE_MAJOR}.${OPENCUE_MINOR}.${OPENCUE_PATCH}

RUN mkdir -p /opt/opencue
WORKDIR /opt/opencue

RUN curl -SL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/v${OPENCUE_VERSION}/cuebot-${OPENCUE_VERSION}-all.jar \
        -o /opt/opencue/cuebot-latest.jar

ENV grpc_cue_port ${CUEBOT_GRPC_CUE_PORT}
ENV grpc_rqd_port ${CUEBOT_GRPC_RQD_PORT}

EXPOSE ${CUEBOT_GRPC_CUE_PORT}
EXPOSE ${CUEBOT_GRPC_RQD_PORT}

ENV OPENCUE_VERSION="$OPENCUE_VERSION"

ENTRYPOINT ["java", "-jar", "/opt/opencue/cuebot-latest.jar"]
