FROM alpine:latest

LABEL maintainer "Tan Manh Nguyen <tan.mng90@gmail.com"

ENV VARNISH_VERSION

RUN apk update && \
    apk add varnish

EXPOSE 80

COPY start.sh /sbin/start.sh

ENTRYPOINT ["start.sh"]
