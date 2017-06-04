#!/bin/sh
chown -R $UID:$GID /usr/local/bin/traefik /etc/traefik/ssl /etc/traefik/acme
exec su-exec $UID:$GID traefik "$@"
