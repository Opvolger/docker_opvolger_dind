FROM docker:stable-dind

RUN apk --update add \
    bash \
    supervisor \
    openssh \
    docker-compose \
    openjdk11-jre

# openjdk8-jre-base = for running jenkins-slave

RUN mkdir -p /var/log/supervisor

RUN apk add --no-cache nss

RUN rm -rf /var/cache/apk/*

COPY files /
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]