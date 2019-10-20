#!/bin/sh
if [ $(docker ps -f name=green -q) ]
then
    ENV="green"
    OLD="blue"
else
    ENV="blue"
    OLD="green"
fi

echo "Checkiong "$OLD" container"
if  curl --output /dev/null --silent --retry 5 --show-error --head --fail ${1}
  then
        echo ""
        echo "Removing "$OLD" container"
        docker rm -f $(docker ps -af name=$OLD -q)
  else
        echo "Removing "$ENV" container"
        docker rm -f $(docker ps -af name=$ENV -q)

        echo "Waiting..."
        sleep 5s

        echo "Starting "$OLD" container"
        docker-compose --project-name=$OLD up -d
        exit 1
  fi
