#!/bin/bash
# =============================================================================
# Kill process running on a specific port
# Usage: ./scripts/kill-port.sh <port>
# =============================================================================

set -e

PORT=$1

if [ -z "$PORT" ]; then
    echo "Usage: $0 <port>"
    echo "Example: $0 3000"
    exit 1
fi

echo "Finding process on port $PORT..."

# Find PID using the port
PID=$(lsof -ti :$PORT 2>/dev/null || true)

if [ -z "$PID" ]; then
    echo "No process found on port $PORT"
    exit 0
fi

echo "Found process $PID on port $PORT"
echo "Killing process..."

kill -9 $PID 2>/dev/null || true

# Verify it's dead
sleep 1
if lsof -ti :$PORT > /dev/null 2>&1; then
    echo "Warning: Process may still be running"
    exit 1
else
    echo "Process killed successfully. Port $PORT is now available."
fi
