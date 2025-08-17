FROM alpine:3.20

LABEL maintainer="Nikolaos Dimopoulos <nikos@niden.net>"

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
	DB_ROOT_PASS="password"

RUN apk add --no-cache --update \
        bash \
        bash-completion \
        curl \
        git \
        grep \
        less \
        mariadb \
        mariadb-client \
        nano \
        wget;

COPY ./support/ /
RUN  chmod +x /entrypoint.sh

VOLUME ["/data"]

EXPOSE 3306

CMD ["/entrypoint.sh"]
