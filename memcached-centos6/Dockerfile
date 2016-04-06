FROM niden/base-centos6

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

# Necessary packages
RUN yum -y update; \
    yum -y install memcached; \
    yum clean all; \
    rm -rf /tmp/* /var/tmp/* /var/lib/yum/history/*

# Define user and port
USER memcached
EXPOSE 11211

# Define default command
CMD ["/usr/bin/memcached", "-u", "memcache", "-v"]

