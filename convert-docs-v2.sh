#!/bin/bash

# assigning variables
IMAGE_NAME="garuda-docs-image"
CONTAINER_NAME="garuda-docs-container"
HOST_PORT=4444

# convert api docs from post_collection.json to output.yaml
convert_docs() {
  echo "Converting postman_collection.json file to output.yaml"
  node ./index.js
}


# building garuda-docs-image
docker_build() {
  # getting garuda-docs-image id 
  local RESULT=$(bash -c "docker images $IMAGE_NAME --format "{{.ID}}"")

  # checking if garuda-docs-image already exists
  if [ ! -z "$RESULT" ]
  then
    echo "garuda-docs-image already exists (Image ID: "$RESULT"). Removing garuda-docs-image"
    docker rmi -f $IMAGE_NAME && docker build . -t $IMAGE_NAME
  else 
    echo "Building garuda-docs-image"
    docker build . -t $IMAGE_NAME
  fi
}

# running garuda-docs-container
docker_run() {
  # getting garuda-docs-container id 
  local RESULT=$(bash -c "docker ps -aqf "name=$CONTAINER_NAME"")

  echo $RESULT

  if [ ! -z "$RESULT" ]
  then
    echo "garuda-docs-container already exists (Container ID: "$RESULT"). Removing garuda-docs-container"
    docker rm -f $CONTAINER_NAME && docker run --name $CONTAINER_NAME -it --rm -dp $HOST_PORT:80
  else 
    echo "Running garuda-docs-container" 
    docker run --name $CONTAINER_NAME -it --rm -dp $HOST_PORT:80 $IMAGE_NAME
  fi
  
}

# opens localhost for preview
preview() {
  echo "Opening http://localhost:$HOST_PORT/ to preview doc"
  start http://localhost:$HOST_PORT/
}




convert_docs
docker_build
docker_run
preview


