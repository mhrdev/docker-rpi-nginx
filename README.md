# docker-rpi-nginx

Docker build for Nginx on Raspberry Pi. The image is created by compiling Nginx
from source in a seperate container and installing these version in the main
image. This enables the use of the latest versions of Nginx on a Raspberry Pi and keeps the docker image clean from compile dependencies.

## Building this image
Make sure you put the correct versions in all files
`Dockerfile`, `build/Dockerfile`, `build/extractdeb.sh`.

Run the build steps:
```
$ cd build
$ ./build.sh
$ ./extractdeb.sh
$ cd ..
$ docker build -t mariusrumpf/rpi-nginx .
```
