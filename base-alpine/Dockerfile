FROM alpine:3.3

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
    grep \
    git \
    htop \
    less \
    make \
    nano \
    openssh-client \
    sed \
    wget

# Timezone
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" | tee /etc/timezone && \
    apk del tzdata
