FROM niden/php-cli-alpine:5.6

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

ENV COMPOSER_HOME /home/composer
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

# Necessary packages
RUN addgroup -S composer; \
    adduser -u 1000 -D -G composer composer; \
    apk add --no-cache --update \
    php5-dom \
    php5-phar; \
    rm /etc/php5/conf.d/xdebug.ini; \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer; \
    chmod +x /usr/local/bin/composer; \
    chown composer.composer /usr/local/bin/composer

USER composer

COPY ./support/etc /etc

# Display version information
RUN composer --ansi --version

# Set up the application directory
VOLUME ["/app"]

# Define working directory
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
