FROM gilir/rpi-alpine:3.5

ENV TRAEFIK_VERSION 1.2.3

LABEL maintainer="Julien Lavergne <julien@lavergne.online>" alpine_version="3.5" traefik_version="${TRAEFIK_VERSION}"

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-arm /traefik

RUN apk upgrade --no-cache && \
    apk add --no-cache ca-certificates && \
    rm -rf /var/cache/apk/*traefi

RUN chmod +x /traefik

EXPOSE 80 8080 443

ENTRYPOINT ["/traefik"]
