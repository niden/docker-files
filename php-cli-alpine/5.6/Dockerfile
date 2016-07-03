FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>
LABEL      "Credits"="Serghei Iakovlev <serghei@phalconphp.com>"

RUN apk add --no-cache --update \
    libxml2 \
    php5-cli \
    php5-common \
    php5-curl \
    php5-dev \
    php5-intl \
    php5-json \
    php5-mcrypt \
    php5-opcache \
    php5-pdo \
    php5-pdo_mysql \
    php5-pdo_sqlite \
    php5-pdo_pgsql \
    php5-pdo_odbc \
    php5-phalcon \
    php5-pear \
    php5-xml; \
    apk add --no-cache \
            --update \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
            --allow-untrusted \
    php5-memcached \
    php5-xdebug; \
    mkdir /www

COPY ./support/etc /etc

WORKDIR /www

# Expose volumes
VOLUME ["/www"]

EXPOSE 80

ENTRYPOINT ["/usr/bin/php"]
CMD ["-v"]