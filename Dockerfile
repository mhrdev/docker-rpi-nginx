# Pull base image.
FROM resin/rpi-raspbian:jessie

# Bring in our compiled package
COPY build/nginx_1.9.9-1~jessie_armhf.deb /tmp/

# Install nginx from registry and replace it with newer version
RUN \
    apt-get update && \
    apt-get install -y nginx && \
    dpkg -i --force-overwrite /tmp/nginx_1.9.9-1~jessie_armhf.deb && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /tmp/nginx_1.9.9-1~jessie_armhf.deb && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Expose ports.
EXPOSE 80
EXPOSE 443

# Define default command.
CMD ["nginx"]
