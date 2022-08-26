FROM alpine:latest

LABEL maintainer="Nikolaos Dimopoulos <nikos@niden.net>"

RUN apk add --no-cache --update \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    libreoffice \
    ttf-dejavu

CMD ["libreoffice"]
