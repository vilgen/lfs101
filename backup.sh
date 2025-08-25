#!/bin/bash

# Use the modern syntax for command substitution
DATE=$(date "+%Y-%m-%d")

# Define the full path to the backup directory
BACKUP_DIR="$HOME/backups"

# The -p flag will create the directory if it doesn't exist,
# and do nothing if it does.
mkdir -p "$BACKUP_DIR"

# Copy and rename the file in a single, simple command.
cp ~/important_document.txt "$BACKUP_DIR/$DATE-important_document.txt"
