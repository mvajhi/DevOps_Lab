#!/bin/sh

NODE_NAME=${NODE_NAME:-"Unknown Node"}

# Copy the provided keepalived configuration
cp /etc/keepalived/external/keepalived.conf /etc/keepalived/keepalived.conf

# Start HAProxy in the background
echo "Starting HAProxy..."
haproxy -f /usr/local/etc/haproxy/haproxy.cfg -D

# Wait for HAProxy to be ready
echo "Waiting for HAProxy to start..."
sleep 3
until wget -q -O /dev/null -T 2 http://127.0.0.1:80 2>/dev/null; do
    echo "HAProxy not ready yet, waiting..."
    sleep 1
done
echo "HAProxy is ready on ${NODE_NAME}!"

# Start Keepalived in the foreground
exec keepalived --dont-fork --log-console