#!/bin/bash

cd /home/docker/action-runner

./config.sh --url https://github.com/${ORGANIZATION} \
--token ${TOKEN} \
--name "${RUNNER_NAME}-${HOSTNAME}" \
--labels ${LABELS} \
--unattended \
--replace

cleanup() {
echo "Removing runner..."
    ./config.sh remove --unattended --token ${TOKEN}
}
trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!