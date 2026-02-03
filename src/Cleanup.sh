#!/bin/bash

echo CLEANUP

# Target directory for logs
TARGET_DIR="${1:-$HOME/Shellog/Logs}"

# Silent check: if directory doesn't exist, exit quietly
[ ! -d "$TARGET_DIR" ] && exit 0

# Professional silent cleanup:
# -mindepth 1: prevents deleting the Logs folder itself
# -maxdepth 1: targets only the session folders/files inside
# -mtime +90: strictly older than 90 days
# -exec rm -rf {} +: deletes everything found efficiently in bulk
find "$TARGET_DIR" -mindepth 1 -maxdepth 1 -mtime +90 -exec rm -rf {} +

