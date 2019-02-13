FROM alpine

RUN apk update && \
apk add --no-cache ansible curl && \
rm -rf /tmp/* && \
rm -rf /var/cache/apk/*

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary" | tar -zx -C /usr/local/bin

RUN adduser -D ansible

USER ansible
