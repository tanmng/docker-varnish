FROM alpine:latest

LABEL maintainer "Tan Manh Nguyen <tan.mng90@gmail.com"

# The version of Varnish we wish to install
ARG VARNISH_VERSION=4.1.9-r0
ENV VARNISH_VERSION ${VARNISH_VERSION}

RUN apk update && \
    apk add "varnish=${VARNISH_VERSION}"

EXPOSE 80

COPY start.sh /sbin/start.sh

ENTRYPOINT ["start.sh"]
