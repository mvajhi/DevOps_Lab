#!/bin/sh

NODE_NAME=${NODE_NAME:-"Unknown Node"}

cp /etc/keepalived/external/keepalived.conf /etc/keepalived/keepalived.conf

mkdir -p /usr/share/nginx/html
echo "<h1>Hello from ${NODE_NAME}</h1>" > /usr/share/nginx/html/index.html

# Start Nginx
nginx

# Wait for nginx to be ready
echo "Waiting for nginx to start..."
sleep 3
until curl -sf http://127.0.0.1:80 > /dev/null; do
    echo "Nginx not ready yet, waiting..."
    sleep 1
done
echo "Nginx is ready!"

# Start Keepalived in the foreground
exec keepalived --dont-fork --log-console