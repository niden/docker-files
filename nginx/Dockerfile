FROM niden/base

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

COPY ./support/ /

RUN addgroup -S nginx; \
    adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx; \
    apk add --no-cache --update \
    nginx; \
    chmod -R 775 /data; \
    chown -R nginx:nginx /data

# Expose volumes
VOLUME ["/data"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]