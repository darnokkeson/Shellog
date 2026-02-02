#!/bin/bash

# Define the target directory with the default path we discussed
TARGET_DIR="${1:-$HOME/Shellog/Logs}"

# Safety check: Verify if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Shellog Error: Directory $TARGET_DIR does not exist."
    exit 1
fi

# Find and delete files older than 90 days (approx. 3 months)
# -type f : looks for files only
# -mtime +90 : modified more than 90 days ago
# -delete : removes the files directly
find "$TARGET_DIR" -type d -mtime +90 -exec rm -rf {} + 

