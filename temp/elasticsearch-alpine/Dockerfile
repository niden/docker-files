FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

# Add necessary packages
RUN apk add --no-cache --update \
    elasticsearch; \
    mkdir -p /data/logs; \
	chown -R elastico:elastico /data

# User
USER elastico

# Copy support files
COPY ./support/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

# Expose volumes
VOLUME ["/data"]

# Expose ports
EXPOSE 9200 9300

# Command
CMD ["elasticsearch"]