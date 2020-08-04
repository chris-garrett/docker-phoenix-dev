FROM bitwalker/alpine-elixir-phoenix:1.10.3
LABEL maintainer="Chris Garrett (https://github.com/chris-garrett/docker-phoenix-dev)"
LABEL description="Phoenix 20.08.03 Development Image"

USER root
ENV PATH /home/sprout/bin:$PATH

RUN set -x \
  && update-ca-certificates --fresh \
  && deluser default \
  && adduser -s /bin/bash -D sprout \
  && mkdir -p /home/sprout/bin \
  && wget https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && tar -C /home/sprout/bin -xzvf dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && rm dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && curl -sL https://taskfile.dev/install.sh | sh \
  && mv ~/bin/task /home/sprout/bin \
  && mix archive.install hex phx_new --force \
  && chown -R sprout:sprout /home/sprout /opt/app /opt/hex /opt/mix \
  && rm -rf /var/cache/apk/*

USER sprout

