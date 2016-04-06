FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

# Set ES version
ENV ELASTICSEARCH_VERSION 2.3.1

# Add necessary packages
RUN apk add --no-cache --update \
    openjdk8-jre-base && \
    mkdir -p /opt && \
    cd /tmp && \
    wget  https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ELASTICSEARCH_VERSION/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
    tar -xzf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
    rm -rf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
    mv elasticsearch-$ELASTICSEARCH_VERSION /opt/elasticsearch

# Copy support files
COPY ./support/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
COPY ./support/entrypoint.sh /entrypoint.sh

# Expose volumes
VOLUME ["/data"]

# Expose ports
EXPOSE 9200
EXPOSE 9300

# Entry point
CMD ["/entrypoint.sh"]