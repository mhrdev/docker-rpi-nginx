# Pull base image.
FROM resin/rpi-raspbian:jessie

# Add nginx sources
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb-src http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.11.6-1~jessie
ENV NGINX_VERSION_FOLDER 1.11.6

WORKDIR /root/build

# Build Nginx.
RUN \
 apt-get update && \
 apt-get install debian-keyring && \
 gpg --keyserver keyserver.ubuntu.com --recv-keys 7BD9BF62 && \
 gpg --no-default-keyring -a --export 7BD9BF62 | gpg --no-default-keyring --keyring ~/.gnupg/trustedkeys.gpg --import - && \ 
 apt-get -y build-dep nginx 

RUN \
 apt-get source nginx=${NGINX_VERSION} && \
 ls -l && \
 cd nginx-${NGINX_VERSION_FOLDER} && \
 DEB_CFLAGS_APPEND=" -fPIE -pie" \
 DEB_CXXFLAGS_APPEND=" -fPIE -pie" \
 dpkg-buildpackage -uc -b && \
 cd .. && \
 rm nginx-${NGINX_VERSION_FOLDER} -fR

CMD ["/bin/bash"]
