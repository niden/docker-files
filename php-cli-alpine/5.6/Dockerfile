FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>
LABEL      "Credits"="Serghei Iakovlev <serghei@phalconphp.com>"

RUN apk add --no-cache --update \
    libxml2 \
    php-cli \
    php-common \
    php-curl \
    php-dev \
    php-intl \
    php-json \
    php-mcrypt \
    php-opcache \
    php-pdo \
    php-pdo_mysql \
    php-pear \
    php-xml; \
    apk add --no-cache \
            --update \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
            --allow-untrusted \
    php-memcached \
    php-phalcon \
    php-xdebug; \
    mkdir /www

COPY ./support/etc /etc

WORKDIR /www

# Expose volumes
VOLUME ["/www"]

EXPOSE 80

ENTRYPOINT ["/usr/bin/php"]
CMD ["-v"]