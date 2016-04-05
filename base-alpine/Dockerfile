FROM alpine:3.3

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

RUN apk update && \
    apk add --no-cache --update \
    bash \
    curl \
    git \
    grep \
    nano \
    wget 

RUN echo "alias l='ls' " > /root/.bashrc
RUN echo "alias la='ls -a' " >> /root/.bashrc
RUN echo "alias ll='ls -l' " >> /root/.bashrc
RUN echo "alias ls='ls -F --color=auto' " >> /root/.bashrc
RUN echo "alias lsd='ls -d */' " >> /root/.bashrc
RUN echo "PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ '" >> /root/.bashrc

RUN echo "[color] " > /root/.gitconfig
RUN echo " ui = true " >> /root/.gitconfig
RUN echo "[alias] " >> /root/.gitconfig
RUN echo " s = status " >> /root/.gitconfig
RUN echo " co = checkout " >> /root/.gitconfig
RUN echo " com = commit " >> /root/.gitconfig
RUN echo " br = branch " >> /root/.gitconfig
RUN echo " l = log --pretty=format:'%h was %an, %ar, message: %s' " >> /root/.gitconfig
RUN echo "[push] " >> /root/.gitconfig
RUN echo " default = current " >> /root/.gitconfig

