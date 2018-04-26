#!/bin/sh

: "${CONSUL_HOST:?Missing required CONSUL_HOST variable}"
: "${CONSUL_PORT:?Missing required CONSUL_PORT variable}"
: "${CONSUL_MOUNTPOINT:?Missing required CONSUL_MOUNTPOINT variable}"

: "${GIT_REPO:?Missing required GIT_REPO variable}"
: "${GIT_BRANCH:?Missing required GIT_BRANCH variable}"

: "${SSH_SERVER_HOSTKEYS:?Missing required SSH_SERVER_HOSTKEYS variable}"
: "${SSH_PRIVATE_KEY:?Missing required SSH_PRIVATE_KEY variable}"

mkdir -p /root/.ssh
echo "${SSH_PRIVATE_KEY}" | tr -d '\r' > /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa
echo "${SSH_SERVER_HOSTKEYS}" > /root/.ssh/known_hosts

mkdir -p /etc/git2consul
envsubst < /init/config.json > /etc/git2consul/config.json

node /usr/lib/node_modules/git2consul --config-file /etc/git2consul/config.json
