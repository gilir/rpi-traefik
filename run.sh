#!/bin/sh
chown $UID:$GID /usr/local/bin/traefik
exec su-exec $UID:$GID traefik "$@"
