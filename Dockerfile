# docker build --force-rm -t <REG>/aws-es-proxy:latest .

FROM alpine:latest

ENV ENDPOINT=
ENV AWS_ACCESS_KEY_ID=
ENV AWS_SECRET_ACCESS_KEY=

RUN apk upgrade --update \
  && apk --update-cache update \
  && apk add --update bash ca-certificates curl  \
  && rm -rf /var/cache/apk/* /tmp/*

# aws-es-proxy-linux-amd64 renamed from aws-es-proxy-<VERSION>-linux-amd64
ADD aws-es-proxy-linux-amd64 /usr/local/bin/aws-es-proxy
ADD docker-entrypoint.sh /var/aws-es-proxy/docker-entrypoint.sh

EXPOSE 9200
CMD []
ENTRYPOINT ["/var/aws-es-proxy/docker-entrypoint.sh"]
