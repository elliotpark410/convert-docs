#!/bin/bash

# assigning variables
IMAGE_NAME="garuda-docs-image"
CONTAINER_NAME="garuda-docs-container"
HOST_PORT=4444


# convert postmancollection.json to output.yaml
convert() {
  echo "Converting postman collection.json to output.yaml"
  node index.js
}


# building garuda-docs-image
docker_build() {
  #getting garuda-docs-container id 
  local CONTAINER_RESULT=$(bash -c "docker ps -aqf "name=$CONTAINER_NAME"")

  if [ ! -z "$CONTAINER_RESULT" ]
  then
    echo "garuda-docs-container already exists (Container ID: "$CONTAINER_RESULT"). Removing garuda-docs-container"
    docker rm -f $CONTAINER_NAME
  fi


  echo "Building garuda-docs-image"
  docker build . -t  $IMAGE_NAME
}

# running garuda-docs-container
docker_run() {
  echo "Running garuda-docs-container"
  docker run --name $CONTAINER_NAME -it --rm -dp $HOST_PORT:80 $IMAGE_NAME  
}

# opens localhost for preview
preview() {
  echo "Opening http://localhost:$HOST_PORT/ to preview doc"
  start http://localhost:$HOST_PORT/
}


convert
docker_build
docker_run
preview

#  preventing script from ever exiting 
 while true 
 do
  sleep 5
 done