#!/bin/sh

export DEPLOY_ENV_NEW=${1}
export DEPLOY_ENV_OLD=${2}
export EXTERNAL_IP=${3}

if [ "x$DEPLOY_ENV_NEW" != "x" ]; then
  echo "DEPLOY_ENV_NEW is null > exit 1" && exit 1
elif [ "x$DEPLOY_ENV_OLD" != "x" ]; then
  echo "DEPLOY_ENV_OLD is null > exit 1" && exit 1
elif [ "x$EXTERNAL_IP" != "x" ]; then
  echo "EXTERNAL_IP is null > exit 1" && exit 1  
fi;


echo "Checkiong "$DEPLOY_ENV_NEW" container"
if  curl --output /dev/null --silent --retry 5 --show-error --head --fail ${EXTERNAL_IP}
  then
        echo "Removing "$DEPLOY_ENV_OLD" container"
        docker rm -f $(docker ps -af name=${DEPLOY_ENV_OLD} -q)
  else
        echo "Removing "$DEPLOY_ENV_NEW" container"
        docker rm -f $(docker ps -af name=${DEPLOY_ENV_NEW} -q)

        echo "Waiting..."
        sleep 5s

        echo "Starting "$DEPLOY_ENV_OLD" container"
        docker-compose --project-name=$DEPLOY_ENV_OLD up -d
        exit 1
  fi
