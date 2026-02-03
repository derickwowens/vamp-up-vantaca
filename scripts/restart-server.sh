#!/bin/bash
# =============================================================================
# Restart a development server
# Usage: ./scripts/restart-server.sh <target>
# Targets: frontend, backend, docs, all
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

TARGET=$1

# Port assignments
FRONTEND_PORT=3000
BACKEND_PORT=8080
DOCS_PORT=8000

kill_port() {
    local port=$1
    "$SCRIPT_DIR/kill-port.sh" $port
}

start_frontend() {
    echo "Starting frontend server on port $FRONTEND_PORT..."
    kill_port $FRONTEND_PORT
    cd "$PROJECT_ROOT"
    if [ -f "package.json" ]; then
        npm run dev &
        echo "Frontend server starting..."
    else
        echo "No package.json found. Skipping frontend."
    fi
}

start_backend() {
    echo "Starting backend server on port $BACKEND_PORT..."
    kill_port $BACKEND_PORT
    cd "$PROJECT_ROOT"
    if [ -f "package.json" ] && grep -q '"start:backend"' package.json 2>/dev/null; then
        npm run start:backend &
        echo "Backend server starting..."
    else
        echo "No backend script found. Skipping backend."
    fi
}

start_docs() {
    echo "Starting docs server on port $DOCS_PORT..."
    kill_port $DOCS_PORT
    cd "$PROJECT_ROOT"
    if [ -f "mkdocs.yml" ]; then
        mkdocs serve -a localhost:$DOCS_PORT &
        echo "Docs server starting at http://localhost:$DOCS_PORT"
    else
        echo "No mkdocs.yml found. Skipping docs."
    fi
}

case "$TARGET" in
    frontend)
        start_frontend
        ;;
    backend)
        start_backend
        ;;
    docs)
        start_docs
        ;;
    all)
        start_frontend
        start_backend
        start_docs
        ;;
    *)
        echo "Usage: $0 <target>"
        echo ""
        echo "Targets:"
        echo "  frontend  - Restart frontend dev server (port $FRONTEND_PORT)"
        echo "  backend   - Restart backend API server (port $BACKEND_PORT)"
        echo "  docs      - Restart MkDocs server (port $DOCS_PORT)"
        echo "  all       - Restart all servers"
        exit 1
        ;;
esac

echo ""
echo "Done."
