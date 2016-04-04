FROM alpine:3.3

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>
LABEL      "Credits"="Serghei Iakovlev <serghei@phalconphp.com>"

ENV HOME     /root
ENV TIMEZONE "America/New_York"

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

RUN echo 'alias ls="ls --color=auto"' >> /etc/profile
RUN echo 'alias l="ls -lah"' >> /etc/profile
RUN echo 'alias ll="ls -lh"' >> /etc/profile
RUN echo 'PS1='\''\[\033[01;32m\]\u@\h\[\033[01;34m\] '\''' >> /etc/profile
RUN echo 'source /etc/profile' >> /root/.bashrc

# Timezone
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" | tee /etc/timezone && \
    apk del tzdata
