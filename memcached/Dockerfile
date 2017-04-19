FROM niden/base

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

# Necessary packages
RUN adduser -D memcache; \
    apk add --no-cache --update memcached

# Define user and port
USER memcache
EXPOSE 11211

# Define default command
ENTRYPOINT ["memcached"]

