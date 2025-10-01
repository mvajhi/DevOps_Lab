FROM alpine
# from https://github.com/AhmadRafiee/DevOps_Certification
RUN apk add --no-cache --update \
    git \
    curl \
    ca-certificates \
    openssh \
    && rm -rf /var/cache/apk

RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc \
    && chmod +x mc \
    && mv mc /usr/local/bin/ \
    && mc --version