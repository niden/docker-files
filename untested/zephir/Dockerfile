FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>
LABEL      "Credits"="Serghei Iakovlev <serghei@phalconphp.com>"

ENV ZEPHIRDIR /usr/share/zephir

RUN mkdir -p /usr/share/zephir
RUN apk add --no-cache --update \
    autoconf \
    gcc \
    make \
    php \
    php-json \
    re2c \
    sudo

RUN git clone --depth=1 -v https://github.com/phalcon/zephir /tmp/zephir
RUN cd /tmp/zephir/ && ./install -c
RUN cp -vr /tmp/zephir/ /usr/share/zephir/
RUN rm -rf /tmp/zephir/

VOLUME ["/zephir"]

# Define working directory
WORKDIR /zephir

# Set up the command arguments
ENTRYPOINT ["zephir"]
CMD ["help"]
