#!/bin/bash

tag=$1

docker build -t dongzhuoer/rlang:$tag -f $tag.Dockerfile .

echo "$DOCKER_PASSWORD" | docker login -u dongzhuoer --password-stdin
docker push dongzhuoer/rlang:$tag
