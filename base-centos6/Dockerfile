FROM centos:centos6

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>
LABEL      "Credits"="Serghei Iakovlev <serghei@phalconphp.com>"

# Set environment variables
ENV HOME     /root
ENV TIMEZONE "America/New_York"

# Setup timezone
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

# Copy files in the image
COPY ./support/remi-release-6.rpm /root
COPY ./support/.bashrc /root/.bashrc
COPY ./support/environment /etc/environment

# Necessary packages
RUN yum -y update; yum clean all;
RUN yum -y install epel-release; yum clean all
RUN cd /root; rpm -Uvh remi-release-6.rpm
RUN yum -y update; yum clean all;

# Install dependencies
RUN yum -y update; \
    yum -y install \
        autoconf \
        automake \
        curl \
        dnsutils \
        dos2unix \
        gcc \
        gdb \
        gettext \
        git \
        glibc-devel \
        glibc-headers \
        gnutls \
        htop \
        inotify-tools \
        intltool \
        libtool \
        m4 \
        make \
        man \
        mc \
        nano \
        openssh \
        pcre \
        pcre-devel \
        pwgen \
        python-setuptools \
        re2c \
        software-properties-common \
        unzip \
        vim \
        wget; \
        zip; \
    yum clean all


# Setup locale
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8; \
    export LANGUAGE=en_US.UTF-8; \
    export LANG=en_US.UTF-8; \
    export LC_ALL=en_US.UTF-8

# Cleanup package manager
RUN yum clean all; rm -rf /tmp/* /var/tmp/* /var/lib/yum/history/*

# Define working directory
WORKDIR /root

# Define default command
CMD ["/bin/bash"]

