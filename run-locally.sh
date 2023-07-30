#!/usr/bin/env sh

set -ex
docker image build -t rothan/cleanup-docker:development .
docker container run --rm -it \
    -e INITIAL_DELAY=0 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    rothan/cleanup-docker:development
