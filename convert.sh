#!/bin/bash


# convert api docs from post_collection.json to output.yaml
convert_docs() {
  echo "Converting postman_collection.json file to output.yaml"
  node ./index.js
}

convert_docs


#  preventing script from ever exiting 
 while true 
 do
  sleep 5
 done

#  exit 0