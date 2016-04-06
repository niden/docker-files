FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

ENV COMPOSER_HOME /root/composer
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

# Necessary packages
RUN apk add --no-cache --update \
    php \
    php-curl \
    php-openssl \
    php-json \
    php-phar \
    php-dom  && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

# Memory Limit
COPY ./support/basic.ini /etc/php/conf.d/

# Display version information
RUN composer --ansi --version

# Set up the application directory
VOLUME ["/app"]

# Define working directory
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
