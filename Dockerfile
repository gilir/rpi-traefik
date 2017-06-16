FROM arm32v6/alpine:3.6

# Upgrating the image first, to have the last version of all packages, and to
# share the same layer accros the images
RUN apk --no-cache upgrade \
    && apk --no-cache add \
       su-exec \
       ca-certificates

ARG TRAEFIK_VERSION=1.3.1

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-arm /usr/local/bin/traefik

RUN chmod +x /usr/local/bin/traefik

LABEL description="Modern HTTP reverse proxy and load balancer" \
      maintainer="Julien Lavergne <julien@lavergne.online>" \
      traefik_version="${TRAEFIK_VERSION}" \
      original_maintainer_url="https://github.com/hypriot/rpi-traefik" \
      project_url="https://docs.traefik.io/" \
      alpine_version="3.6" \
      architecture="arm32v6"

EXPOSE 80 8080 443

ENTRYPOINT ["/usr/local/bin/traefik"]
