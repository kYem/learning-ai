#!/bin/bash
# One-command launcher: starts the Quartz dev server with hot reload
# Usage: ./scripts/start.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

echo ""
echo "Starting Quartz at http://localhost:4444"
echo "Press Ctrl+C to stop"
echo ""
npx quartz build --serve --port 4444
