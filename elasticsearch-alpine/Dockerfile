FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

# Set ES version
ENV ES_VERSION 2.3.1

# Add necessary packages
RUN apk add --no-cache --update \
    openjdk8-jre-base; \
    mkdir -p /opt /data/logs; \
    cd /opt; \
    wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ES_VERSION/elasticsearch-$ES_VERSION.tar.gz; \
    tar -xzf elasticsearch-$ES_VERSION.tar.gz; \
    mv elasticsearch-$ES_VERSION elasticsearch; \
    addgroup elasticsearch; \
	adduser -D -G elasticsearch -h /opt/elasticsearch elasticsearch; \
	chown -R elasticsearch:elasticsearch /opt/elasticsearch; \
	chown -R elasticsearch:elasticsearch /data

# User
USER elasticsearch

# Copy support files
COPY ./support/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

# Expose volumes
VOLUME ["/data"]

# Expose ports
EXPOSE 9200 9300

# Command
CMD ["/opt/elasticsearch/bin/elasticsearch"]