FROM java:8-alpine

ENV DIGDAG_VERSION=0.9.27

RUN apk add --no-cache curl && \
    curl -o /usr/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-$DIGDAG_VERSION" && \
    apk del curl && \
    adduser -h /var/lib/digdag -g 'digdag user' -s /sbin/nologin -D digdag && \
    mkdir -p /var/lib/digdag/logs/tasks /var/lib/digdag/logs/server && \
    chown -R digdag.digdag /var/lib/digdag && \
    \
    apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates curl groff less && \
    apk --no-cache add bash jq && \
    pip --no-cache-dir install awscli && \    
    rm -rf /var/cache/apk/*

USER digdag

WORKDIR /src

ENV DB_TYPE=memory \
    DB_USER=digdag \
    DB_PASSWORD=digdag \
    DB_HOST=127.0.0.1 \
    DB_PORT=5432 \
    DB_NAME=digdag 

EXPOSE 65432

ENTRYPOINT [ "java", "-jar", "/usr/bin/digdag" ]