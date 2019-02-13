FROM alpine

RUN apk --no-cache --update add \
  bzip2 \
  gzip \
  libssl1.0 \
  openssh-client \
  python2 \
  py2-pip \
  tar \
  unzip \
  curl \
  xz

RUN apk --no-cache --update add --virtual .deps \
  gcc \
  libffi-dev \
  linux-headers \
  openssl-dev \
  make \
  musl-dev \
  python2-dev \
  && pip install --upgrade pip \
  && pip install \
  ansible==2.7 \
  apache-libcloud \
  boto \
  boto3 \
  cryptography \
  docker-py \
  jmespath \
  packet-python \
  pycrypto \
  shade \
  && apk del .deps

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary" | tar -zx -C /usr/local/bins

RUN adduser -D ansible

USER ansible
