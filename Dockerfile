FROM alpine:3.7

RUN apk --update add nodejs git openssh ca-certificates gettext libintl \
    && rm -rf /var/cache/apk/* \
    && npm install -g git2consul@0.12.13

ADD init /init/

ENTRYPOINT ["./init/start.sh"]
