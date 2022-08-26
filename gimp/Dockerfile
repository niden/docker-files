FROM alpine:latest

LABEL maintainer="Nikolaos Dimopoulos <nikos@niden.net>"

RUN apk add --no-cache --purge -uU \
	  gimp \
      ttf-dejavu \
      ttf-opensans \
      ttf-font-awesome \
      ttf-freefont \
      fontconfig \
      msttcorefonts-installer \
   && update-ms-fonts \
   && fc-cache -f \
   && rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT [ "gimp" ]
