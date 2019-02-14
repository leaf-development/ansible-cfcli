FROM alpine

RUN apk --update add python py-pip openssl ca-certificates curl && \
apk add --update --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
pip install --upgrade pip && \
pip install --upgrade pycrypto cffi jmespath ansible==2.7.0 && \
apk del build-dependencies && \
rm -rf /tmp/* && \
rm -rf /var/cache/apk/*

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary" | tar -zx -C /usr/local/bin

RUN adduser -D ansible

USER ansible
