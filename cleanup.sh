#!/usr/bin/env sh

set -e

PRUNE_IMAGES=${PRUNE_IMAGES:-1}
PRUNE_CONTAINERS=${PRUNE_CONTAINERS:-1}
PRUNE_VOLUMES=${PRUNE_VOLUMES:-1}
PRUNE_NETWORKS=${PRUNE_NETWORKS:-1}
PRUNE_BUILD_CACHE=${PRUNE_BUILD_CACHE:-1}
PRUNE_SYSTEM=${PRUNE_SYSTEM:-0}

if [ $PRUNE_SYSTEM -ne 0 ]; then
    echo "Cleanup system"
    # --force: Do not prompt for confirmation
    docker system prune --force --all --volumes
else
    if [ $PRUNE_IMAGES -ne 0 ]; then
        echo "Cleanup images"
        # --all: Remove all unused images, not just dangling ones
        # --force: Do not prompt for confirmation
        docker image prune --force --all
    fi
    if [ $PRUNE_CONTAINERS -ne 0 ]; then
        echo "Cleanup containers"
        # --force: Do not prompt for confirmation
        docker container prune --force
    fi
    if [ $PRUNE_NETWORKS -ne 0 ]; then
        echo "Cleanup networks"
        # --force: Do not prompt for confirmation
        docker network prune --force
    fi
    if [ $PRUNE_VOLUMES -ne 0 ]; then
        echo "Cleanup volumes"
        # --all: Remove all unused volumes, not just anonymous ones
        # --force: Do not prompt for confirmation
        docker volume prune --force --all
    fi
    if [ $PRUNE_BUILD_CACHE -ne 0 ]; then
        echo "Cleanup builder"
        # --all: Remove all unused build cache, not just dangling ones
        # --force: Do not prompt for confirmation
        docker builder prune --force --all
    fi
fi
