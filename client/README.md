# Test client environment

## Build the environment

    ./make_env.sh

## Enter environment

    source venv/bin/activate

## Run cuegui

    CUEBOT_HOSTS=localhost cuegui

## Submit Test Jobs

    CUEBOT_HOSTS=localhost python submit_basic_wait_job.py