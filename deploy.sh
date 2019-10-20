#!/bin/sh
export DEPLOY_ENV_NEW=${1}
export DEPLOY_ENV_OLD=${2}

echo "Stopping "$DEPLOY_ENV_OLD" container"
docker-compose --project-name=$DEPLOY_ENV_OLD stop

echo "Waiting..."
sleep 5s

echo "Starting "$DEPLOY_ENV_NEW" container"
docker-compose --project-name=$DEPLOY_ENV_NEW up -d
