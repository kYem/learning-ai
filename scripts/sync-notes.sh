#!/bin/bash
# Syncs your markdown notes into Quartz's content folder
# Run this before building if you've edited notes directly in /notes/

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
NOTES_DIR="$(dirname "$PROJECT_DIR")/notes"

echo "Syncing notes from $NOTES_DIR to $PROJECT_DIR/content/"

# Sync concepts and projects (skip templates)
rsync -av --delete "$NOTES_DIR/concepts/" "$PROJECT_DIR/content/concepts/"
rsync -av --delete "$NOTES_DIR/projects/" "$PROJECT_DIR/content/projects/"
cp "$NOTES_DIR/ROADMAP.md" "$PROJECT_DIR/content/index.md"

echo "Done! Run 'npx quartz build --serve' to preview."
