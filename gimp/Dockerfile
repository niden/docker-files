FROM alpine:3.20

LABEL maintainer="Nikolaos Dimopoulos <nikos@niden.net>"

RUN apk add --no-cache --purge -uU \
      fontconfig \
	  gimp \
      msttcorefonts-installer \
      ttf-dejavu \
      ttf-font-awesome \
      ttf-freefont \
      ttf-opensans && \
    update-ms-fonts && \
    fc-cache -f && \
    rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT [ "gimp" ]
