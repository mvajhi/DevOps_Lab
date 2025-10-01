#!/bin/sh

# Check if HAProxy process is running
if ! pgrep -f "haproxy" > /dev/null; then
    echo "HAProxy process is not running"
    exit 1
fi

# Check if HAProxy is listening on port 80
if ! netstat -tln 2>/dev/null | grep -q ':80 ' && ! ss -tln 2>/dev/null | grep -q ':80 '; then
    echo "HAProxy is not listening on port 80"
    exit 1
fi

# Check if HAProxy responds to HTTP requests
if ! wget -q -O /dev/null -T 2 http://127.0.0.1:80 2>/dev/null; then
    echo "HAProxy is not responding to HTTP requests"
    exit 1
fi

exit 0