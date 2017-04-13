FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>
LABEL      "Credits"="Serghei Iakovlev <serghei@phalconphp.com>"

RUN apk add --no-cache --update \
    sudo \
    autoconf \
    build-base \
    libxml2 \
    php5-cli \
    php5-common \
    php5-curl \
    php5-dev \
    php5-intl \
    php5-json \
    php5-mcrypt \
    php5-opcache \
    php5-openssl \
    php5-pdo \
    php5-pdo_mysql \
    php5-pdo_sqlite \
    php5-pdo_pgsql \
    php5-pdo_odbc \
    php5-xml; \
    apk add --no-cache \
            --update \
            --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
            --allow-untrusted \
    php5-xdebug; \
    apk add --no-cache \
            --update \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
            --allow-untrusted \
    php5-memcached; \
    git clone --depth=1 -v https://github.com/phalcon/cphalcon /tmp/cphalcon; \
    cd /tmp/cphalcon/ext; \
    sudo ./install; \
    cd /root; \
    rm -fR /tmp/*; \
    apk del sudo autoconf build-base; \
    mkdir -p /www; \
    mkdir -p /data

COPY ./support/etc /etc

WORKDIR /www

# Expose volumes
VOLUME ["/www", "/data"]

