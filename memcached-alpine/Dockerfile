FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

COPY support/entrypoint.sh /usr/local/bin/

# Necessary packages
RUN adduser -D memcache; \
    apk add --no-cache --update memcached; \
    ln -s usr/local/bin/entrypoint.sh /entrypoint.sh # backwards compat

ENTRYPOINT ["entrypoint.sh"]

# Define user and port
USER memcache
EXPOSE 11211

# Define default command
ENTRYPOINT ["memcached"]

