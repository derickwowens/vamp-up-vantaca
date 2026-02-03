#!/bin/bash
# =============================================================================
# Setup development environment
# Usage: ./scripts/setup-env.sh
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "============================================"
echo "  Vamp Up Vantaca - Environment Setup"
echo "============================================"
echo ""

cd "$PROJECT_ROOT"

# Check for required tools
echo "Checking required tools..."

check_tool() {
    if command -v $1 &> /dev/null; then
        echo "  [OK] $1"
        return 0
    else
        echo "  [MISSING] $1"
        return 1
    fi
}

MISSING=0
check_tool "node" || MISSING=1
check_tool "npm" || MISSING=1
check_tool "python3" || MISSING=1
check_tool "pip3" || MISSING=1
check_tool "git" || MISSING=1

if [ $MISSING -eq 1 ]; then
    echo ""
    echo "Some required tools are missing. Please install them and try again."
    exit 1
fi

echo ""

# Install Node dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "Installing Node.js dependencies..."
    npm install
    echo ""
fi

# Install Python dependencies for MkDocs
echo "Installing MkDocs and extensions..."
pip3 install --user mkdocs mkdocs-material pymdown-extensions

echo ""

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "Creating .env file from template..."
    if [ -f ".env.example" ]; then
        cp .env.example .env
        echo "  Created .env from .env.example"
    else
        touch .env
        echo "  Created empty .env file"
    fi
    echo "  Remember to fill in your environment variables!"
    echo ""
fi

# Make scripts executable
echo "Making scripts executable..."
chmod +x "$SCRIPT_DIR"/*.sh
echo ""

echo "============================================"
echo "  Setup Complete!"
echo "============================================"
echo ""
echo "Next steps:"
echo "  1. Configure your .env file (if needed)"
echo "  2. Run 'mkdocs serve' to preview docs"
echo "  3. Start building your application"
echo ""
