FROM alpine:latest

LABEL maintainer="Nikolaos Dimopoulos <nikos@niden.net>"

RUN apk add --no-cache --update \
    jq

ENTRYPOINT ["jq --version"]
