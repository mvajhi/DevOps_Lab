#!/bin/sh

# Check if nginx master process is running
if ! pgrep -f "nginx: master process" > /dev/null; then
    echo "Nginx master process is not running"
    exit 1
fi

# Check if nginx responds to HTTP requests on localhost
if ! wget -q -O /dev/null -T 2 http://127.0.0.1:80 2>/dev/null; then
    echo "Nginx is not responding to HTTP requests"
    exit 1
fi

exit 0
