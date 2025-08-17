FROM alpine:3.20

LABEL maintainer="Nikolaos Dimopoulos <nikos@niden.net>"

RUN apk add --no-cache --purge -uU \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        fontconfig \
        libreoffice \
        msttcorefonts-installer \
        ttf-dejavu && \
    update-ms-fonts && \
    fc-cache -f && \
    rm -rf /var/cache/apk/* /tmp/*

CMD ["libreoffice"]
