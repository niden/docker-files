FROM niden/base-alpine

MAINTAINER Nikolaos Dimopoulos <nikos@niden.net>

# Necessary packages
RUN apk add --no-cache --update \
    xvfb \
    ttf-freefont \
    fontconfig; \
    apk add --update-cache \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
            --allow-untrusted \
    wkhtmltopdf; \
    # Wrapper for xvfb
    mv /usr/bin/wkhtmltopdf /usr/bin/wkhtmltopdf-origin

COPY ./support/wkhtmltopdf /usr/bin
RUN  chmod +x /usr/bin/wkhtmltopdf

# Set up the command arguments
ENTRYPOINT ["/usr/bin/wkhtmltopdf"]
CMD ["-h"]
