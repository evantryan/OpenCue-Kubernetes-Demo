FROM postgres:15.1

ARG OPENCUE_MAJOR=1
ARG OPENCUE_MINOR=0
ARG OPENCUE_PATCH=0
ARG OPENCUE_VERSION=${OPENCUE_MAJOR}.${OPENCUE_MINOR}.${OPENCUE_PATCH}

# RUN mkdir /docker-entrypoint-initdb.d/
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

# Get schema
RUN curl -SL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/v${OPENCUE_VERSION}/schema-${OPENCUE_VERSION}.sql \
        -o /docker-entrypoint-initdb.d/schema.sql

# Get seed data
RUN curl -SL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/v${OPENCUE_VERSION}/seed_data-${OPENCUE_VERSION}.sql \
        -o /docker-entrypoint-initdb.d/seed_data.sql