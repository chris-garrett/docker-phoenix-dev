FROM bitwalker/alpine-elixir-phoenix:1.10.3
LABEL maintainer="Chris Garrett (https://github.com/chris-garrett/docker-phoenix-dev)"
LABEL description="Phoenix 20.07.18 Development Image"

USER root

RUN set -x \
  && update-ca-certificates --fresh \
  && wget https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && rm dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && mix archive.install hex phx_new --force \
  && adduser -s /bin/bash -D sprout \
  && chown -R sprout:sprout /opt/app /opt/hex /home/sprout \
  && rm -rf /var/cache/apk/*

USER sprout

