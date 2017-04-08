FROM armhf/alpine:3.5

ENV TRAEFIK_VERSION 1.2.1

LABEL maintainer="Julien Lavergne <julien@lavergne.online>" alpine_version="3.5" traefik_version="${TRAEFIK_VERSION}"

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-arm /traefik

RUN apk upgrade --no-cache &&\
    apk add --no-cache ca-certificates

RUN chmod +x /traefik

EXPOSE 80 8080 443

ENTRYPOINT ["/traefik"]
