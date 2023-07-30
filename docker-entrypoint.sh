#!/usr/bin/env sh

# delay the first cleanup for X seconds to avoid cleaning
# images/containers file a docker stack is about to be deployed.
echo "** Initial sleeping for: ${INITIAL_DELAY} seconds"
sleep "$INITIAL_DELAY"

while :; do 
    echo '** Starting cleanup.'
    ./cleanup.sh
    echo '** Cleanup done.'

    echo "** Sleeping for: ${CLEANUP_RATE} seconds"
    sleep "$CLEANUP_RATE"
done
