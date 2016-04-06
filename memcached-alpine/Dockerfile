FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

# Necessary packages
RUN apk add --no-cache --update memcached

# Define user and port
USER memcached
EXPOSE 11211

# Define default command
ENTRYPOINT ["memcached"]

