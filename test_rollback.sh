#!/bin/sh

echo "Checkiong "$DEPLOY_ENV_NEW" container"
if  curl --output /dev/null --silent --retry 5 --show-error --head --fail ${1}
  then
        echo "Removing "$DEPLOY_ENV_OLD" container"
        docker rm -f $(docker ps -af name=$DEPLOY_ENV_OLD -q)
  else
        echo "Removing "$DEPLOY_ENV_NEW" container"
        docker rm -f $(docker ps -af name=$DEPLOY_ENV_NEW -q)

        echo "Waiting..."
        sleep 5s

        echo "Starting "$DEPLOY_ENV_OLD" container"
        docker-compose --project-name=$DEPLOY_ENV_OLD up -d
        exit 1
  fi
