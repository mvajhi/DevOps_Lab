FROM ubuntu:22.04
LABEL maintainer="mahdi vajhi <mvajhi@gmail.com>"

RUN apt update && apt install -y nginx \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
