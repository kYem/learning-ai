#!/bin/bash
# One-command launcher: syncs notes and starts the Quartz dev server
# Usage: ./scripts/start.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

# Sync latest notes
bash "$SCRIPT_DIR/sync-notes.sh"

# Start dev server with hot reload
echo ""
echo "Starting Quartz at http://localhost:4444"
echo "Press Ctrl+C to stop"
echo ""
npx quartz build --serve --port 4444
