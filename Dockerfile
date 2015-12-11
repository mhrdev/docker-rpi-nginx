# Pull base image.
FROM resin/rpi-raspbian:jessie

# Bring in our compiled package
COPY nginx_1.9.9-1~jessie_armhf.deb /tmp/

# Install nginx from registry and replace it with newer version
RUN \
    apt-get update && \
    apt-get install -y nginx && \
    dpkg -i --force-overwrite /tmp/nginx_1.9.9-1~jessie_armhf.deb && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /tmp/nginx_1.9.9-1~jessie_armhf.deb

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
