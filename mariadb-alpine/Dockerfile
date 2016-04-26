FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

ENV LANG="en_GB.UTF-8" \
    LC_ALL="en_GB.UTF-8" \
    LANGUAGE="en_GB.UTF-8" \
	DB_ROOT_PASS="password"

RUN apk add --no-cache --update \
      mariadb mariadb-client;

COPY ./support/ /
RUN  chmod +x /entrypoint.sh

VOLUME ["/data"]

EXPOSE 3306

CMD ["/entrypoint.sh"]