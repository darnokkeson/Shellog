#!/bin/bash

# Script to create .log and .txt files of entire shell session
# Usage: ./Shellog.sh [base_directory]

# Script to create missing .txt file when in last session wasn't 
# because of crash system or closing terminal by x
./src/Healing.sh

# START directory
SHELLOG=Shellog

# dir with Logs
LOG_STORE=Logs

# Get today's date in YYYYMMDD format
TODAY=$(date +"%Y%m%d")

# Create today's date folder inside Shellog
mkdir -p "$HOME/$SHELLOG/$LOG_STORE/$TODAY"

# Define log file path
FILE="$HOME/$SHELLOG/$LOG_STORE/$TODAY/$(date +%Y%m%d_%H%M%S)"

LOG_FILE="${FILE}.log"
TXT_FILE="${FILE}.txt"

# Start script session with -f flag (flush output immediately)
script -f "$LOG_FILE"

# Doing perl on .log file, which was created already
perl -pe 's/\e\[\?2004[hl]//g; s/\e\]0;.*?\a//g; s/\x07//g; s/\r//g' "$LOG_FILE" >> "$TXT_FILE"

# Starting Script to automate removal old directory and .log and .txt files
./src/Cleanup.sh
