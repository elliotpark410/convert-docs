#!/bin/bash

# assigning variables
IMAGE_NAME="garuda-docs-image"
CONTAINER_NAME="garuda-docs-container"
HOST_PORT=3331

# building garuda-docs-image
docker_build() {
  #getting garuda-docs-container id 
  local CONTAINER_RESULT=$(bash -c "docker ps -aqf "name=$CONTAINER_NAME"")

  # getting garuda-docs-image id 
  local IMAGE_RESULT=$(bash -c "docker images $IMAGE_NAME --format "{{.ID}}"")

  if [ ! -z "$CONTAINER_RESULT" ]
  then
    echo "garuda-docs-container already exists (Container ID: "$CONTAINER_RESULT"). Removing garuda-docs-container"
    docker rm -f $CONTAINER_NAME
  fi

  if [ ! -z "$IMAGE_RESULT" ]
  then
    echo "garuda-docs-image already exists (Image ID: "$IMAGE_RESULT"). Removing garuda-docs-image"
    docker rmi -f $IMAGE_NAME
  fi

  echo "Building garuda-docs-image"
  docker build . -t $IMAGE_NAME
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

# if garuda-docs-container exists, then force remove
docker_remove_container() {
  # getting garuda-docs-container id 
  local CONTAINER_RESULT=$(bash -c "docker ps -aqf "name=$CONTAINER_NAME"")

  if [ ! -z "$CONTAINER_RESULT" ]
  then
    echo "garuda-docs-container already exists (Container ID: "$CONTAINER_RESULT"). Removing garuda-docs-container"
    docker rm -f $CONTAINER_NAME
  fi
}

# if garuda-docs-image exists, then force remove
docker_remove_image() {
  # getting garuda-docs-image id 
  local IMAGE_RESULT=$(bash -c "docker images $IMAGE_NAME --format "{{.ID}}"")

  if [ ! -z "$IMAGE_RESULT" ]
  then
    echo "garuda-docs-image already exists (Image ID: "$IMAGE_RESULT"). Removing garuda-docs-image"
    docker rmi -f $IMAGE_NAME
  fi
}


docker_build
docker_run
preview
docker_remove_container
docker_remove_image

#  preventing script from ever exiting 
 while true 
 do
  sleep 5
 done