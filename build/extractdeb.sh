#!/bin/bash -e
VERSION=1.11.6-1~jessie
containerID=$(docker run -d mariusrumpf/buildnginx)
docker cp $containerID:/root/build/nginx_${VERSION}_armhf.deb .
sleep 1
docker rm $containerID
