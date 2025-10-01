FROM alpine:latest

RUN apk update && apk add --no-cache keepalived nginx curl wget

COPY entrypoint.sh /entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY check_nginx.sh /usr/local/bin/check_nginx.sh
RUN chmod +x /entrypoint.sh /usr/local/bin/check_nginx.sh

ENTRYPOINT ["/entrypoint.sh"]