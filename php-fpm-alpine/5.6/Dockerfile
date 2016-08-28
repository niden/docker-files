FROM niden/php-cli-alpine:5.6

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

RUN set -x; \
	addgroup -g 82 -S www-data; \
	adduser -u 82 -D -S -G www-data www-data; \
    apk add --no-cache --update \
    php5-fpm; \
    mkdir -p /www; \
    mkdir -p /data; \
    mkdir -p /data/logs;

COPY ./support/etc /etc

# Expose volumes
VOLUME ["/data", "/www"]

# Expose ports
EXPOSE 9000 10000

ENTRYPOINT ["/usr/bin/php-fpm", "-F"]
