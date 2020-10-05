FROM docker:stable-dind

RUN apk --update add \
    bash \
    git \
    libressl-dev \
    libffi-dev \
    build-base \
    cmd:pip3\
    python3 \
    python3-dev \
    supervisor \
    openssh \
    openjdk8-jre-base

# openjdk8-jre-base = for running jenkins-slave

# install docker-compose
RUN pip3 install --upgrade pip && \
    pip3 install docker-compose && \
    mkdir -p /var/log/supervisor

RUN apk add --no-cache nss

RUN rm -rf /var/cache/apk/*

COPY files /
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]