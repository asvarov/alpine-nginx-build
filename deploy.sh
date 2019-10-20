#!/bin/sh
if [ $(docker ps -f name=blue -q) ]
then
    ENV="green"
    OLD="blue"
else
    ENV="blue"
    OLD="green"
fi

echo "Stopping "$OLD" container"
docker-compose --project-name=$OLD stop

echo "Waiting..."
sleep 5s

echo "Starting "$ENV" container"
docker-compose --project-name=$ENV up -d
