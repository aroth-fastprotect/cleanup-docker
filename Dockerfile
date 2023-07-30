FROM docker:cli

WORKDIR /app
ADD docker-entrypoint.sh cleanup.sh ./

ENV CLEANUP_RATE=86400 \
    INITIAL_DELAY=3600 \
    PRUNE_IMAGES=1 \
    PRUNE_CONTAINERS=1 \
    PRUNE_VOLUMES=1 \
    PRUNE_NETWORKS=1 \
    PRUNE_BUILD_CACHE=1 \
    PRUNE_SYSTEM=0

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
