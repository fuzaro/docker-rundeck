#!/bin/bash
VERSION=2.6.1
NAME="mbopm/rundeck"

docker build -t $NAME:$VERSION .
docker tag -f  $NAME:$VERSION $NAME:latest
