ARG PHP_VERSION=8.3

FROM php:${PHP_VERSION}-cli AS base

ARG PHP_VERSION=8.4
ARG PHALCON_VERSION=5.9.2
ARG UID=1000
ARG GID=1000
ARG USER=niden
ARG GROUP=niden

ENV PATH=/app/bin:/app:${PATH} \
    PHP_VERSION=${PHP_VERSION} \
    PHALCON_VERSION=${PHALCON_VERSION}

COPY --from=ghcr.io/mlocati/php-extension-installer \
        /usr/bin/install-php-extensions \
        /usr/local/bin/
COPY --from=composer/composer:2 \
        --chown=${USER}:${GROUP} \
        --chmod=0775 \
        /usr/bin/composer \
        /usr/local/bin/composer
COPY /config/ /config/

SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

RUN set -eux && \
# Add user and group \
    groupadd -g ${GID} ${GROUP} && \
    useradd -l -u ${UID} -g ${GID} -d /app ${USER} && \
    usermod -s /bin/bash ${USER} && \
    mkdir /app && \
    chown ${USER}:${GROUP} /app && \
    chmod 0775 /app && \
    apt update -y && \
    apt upgrade -y && \
    apt install --no-install-recommends -yq \
    curl \
    nano \
    sudo \
    unzip \
    wget && \
# Install php extensions \
    install-php-extensions \
      apcu \
      gettext \
      gd \
      igbinary \
      imagick \
      intl \
      mysqli \
      opcache \
      pcov \
      pdo_mysql \
      pdo_pgsql \
      pgsql \
      redis \
      xsl \
      yaml \
      zip \
      phalcon-${PHALCON_VERSION} && \
    apt autoremove --purge -y && \
    apt autoclean -y && \
    apt clean -y && \
    rm -rf /tmp/* /var/tmp/* && \
    find /var/cache/apt/archives /var/lib/apt/lists -not -name lock -type f -delete && \
    find /var/cache -type f -delete && \
    find /var/log -type f | while read -r f; do echo -n '' > "${f}"; done && \
# Bash \
    echo "" >> /etc/bash.bashrc && \
    cat /config/bashrc >> /etc/bash.bashrc && \
    rm -fR /config


WORKDIR /app

USER ${USER}
