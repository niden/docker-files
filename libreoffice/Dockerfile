FROM alpine:latest

LABEL maintainer="Nikolaos Dimopoulos <nikos@niden.net>"

RUN apk add --no-cache --purge -uU \
      --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
      --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
      libreoffice \
      ttf-dejavu \
      fontconfig \
      msttcorefonts-installer \
   && update-ms-fonts \
   && fc-cache -f \
   && rm -rf /var/cache/apk/* /tmp/*

CMD ["libreoffice"]
