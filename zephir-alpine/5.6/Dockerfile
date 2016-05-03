FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>
LABEL      "Credits"="Serghei Iakovlev <serghei@phalconphp.com>"

RUN mkdir -p /zephir; \
    apk add --no-cache --update \
    git \
    pcre \
    php \
    php-cli \
    php-common \
    php-dev \
    php-json \
    re2c \
    sudo; \
    cd /zephir; \
    git clone --depth=1 -v https://github.com/phalcon/zephir .; \
    ./install -c; \
    mv /usr/local/bin/zephir .; \
    apk del git sudo

VOLUME ["/zephir"]

# Define working directory
WORKDIR /zephir

# Set up the command arguments
ENTRYPOINT ["./zephir"]
CMD ["help"]
