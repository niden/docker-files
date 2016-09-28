FROM alpine:latest

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>
LABEL      "Credits"="Serghei Iakovlev <serghei@phalconphp.com>"

ENV HOME     /root
ENV TIMEZONE "America/New_York"

COPY ./support/.bashrc /root/.bashrc

RUN apk add --no-cache --update \
    bash \
    bash-completion \
    curl \
    docker-bash-completion \
    git \
    grep \
    less \
    nano \
    wget; \
    apk add --no-cache --update tzdata; \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime; \
    echo "${TIMEZONE}" | tee /etc/timezone; \
    apk del tzdata