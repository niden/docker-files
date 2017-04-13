FROM niden/php-cli-alpine:base

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

RUN set -x; \
	addgroup -g 82 -S www-data; \
	adduser -u 82 -D -S -G www-data www-data; \
    mkdir -p /data/config; \
    mkdir -p /data/html; \
    mkdir -p /data/logs; \
    mkdir -p /run/apache2; \
    apk add --no-cache --update \
    apache2 \
    apache2-ssl \
    php5-apache2

COPY ./support/ /

RUN chmod -R 755 /data; \
    chown -R www-data.www-data /data; \
    chmod +x /usr/local/bin/entrypoint.sh

# Expose volumes
VOLUME ["/data"]

# Expose ports
EXPOSE 80 433

# Define default command
CMD ["entrypoint.sh"]
