# docker build --force-rm -t <REG>/aws-es-proxy:latest .

FROM alpine:latest

ENV AWS_ACCESS_KEY_ID=
ENV AWS_SECRET_ACCESS_KEY=
ENV ENDPOINT=
ENV VERBOSE=

RUN apk upgrade --update \
  && apk --update-cache update \
  && apk add --update bash ca-certificates curl  \
  && rm -rf /var/cache/apk/* /tmp/*

ADD dist/aws-es-proxy-linux-amd64 /usr/local/bin/aws-es-proxy
ADD docker-entrypoint.sh /var/aws-es-proxy/docker-entrypoint.sh

EXPOSE 9200
CMD []
ENTRYPOINT ["/var/aws-es-proxy/docker-entrypoint.sh"]
