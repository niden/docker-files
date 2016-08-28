FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>


RUN apk add --no-cache --update \
    nginx; \
    mkdir -p /data; \
    mkdir -p /data/html; \
    mkdir -p /data/config; \
    mkdir -p /data/logs; \
    /etc/nginx/certs; \
    usermod -u 1000 www-data; \
    chown -R www-data.www-data /data; \

COPY ./support/ /

# Define mountable directories
VOLUME ["/data"]

# Expose ports
EXPOSE 80 443

# Define default command
CMD ["nginx", "-g", "daemon off;"]
