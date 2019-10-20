#!/bin/sh
if [ $(docker ps -f name=blue -q) ]
then
    ENV="green"
    OLD="blue"
else
    ENV="blue"
    OLD="green"
fi

echo $ENV > env_new.txt
echo $OLD > env_old.txt

echo "Stopping "$OLD" container"
docker-compose --project-name=$OLD stop

echo "Waiting..."
sleep 5s

echo "Starting "$ENV" container"
docker-compose --project-name=$ENV up -d
