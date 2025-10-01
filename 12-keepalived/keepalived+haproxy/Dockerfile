FROM alpine:3.19

RUN apk update && \
    apk add --no-cache \
    haproxy \
    keepalived \
    curl \
    wget \
    bash \
    iproute2 \
    procps

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY entrypoint.sh /entrypoint.sh
COPY check_hap.sh /usr/local/bin/check_hap.sh
RUN chmod +x /entrypoint.sh /usr/local/bin/check_hap.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]