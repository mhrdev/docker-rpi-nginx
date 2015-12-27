#!/bin/bash -e

containerID=$(docker run -d mariusrumpf/buildnginx)
docker cp $containerID:/root/build/nginx_1.9.9-1~jessie_armhf.deb .
sleep 1
docker rm $containerID
