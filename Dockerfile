FROM docker:stable-dind

RUN apk --update add \
    bash \
    git \
    supervisor \
    openssh \
    docker-compose \
    openjdk11-jre

# git and openjdk11-jre = for running jenkins-slave

RUN mkdir -p /var/log/supervisor

RUN apk add --no-cache nss

RUN rm -rf /var/cache/apk/*

COPY files /
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]