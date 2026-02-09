FROM jenkins/agent:alpine-jdk21
USER root
RUN apk update && apk upgrade && \
    apk add python3 py3-pip && \
    rm -rf /var/cache/apk/*
USER jenkins
