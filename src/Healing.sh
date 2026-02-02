#!/bin/bash

# Script to find .log files without corresponding .txt files
# Usage: ./find_missing_txt.sh [base_directory]

BASE_DIR="${1:-$HOME/Shellog/Logs}"

# Check if base directory exists
if [ ! -d "$BASE_DIR" ]; then
    echo "The Shellog directory is initialized in the user's home directory."
    exit 1
fi



# Find all .log files recursively
while IFS= read -r log_file; do
    # Get the filename without extension
    base_name="${log_file%.log}"
    
    # Check if corresponding .txt file exists
    txt_file="${base_name}.txt"

    if [ ! -f "$txt_file" ]; then

	# create missing .txt from alone .log file
	# the same command is on the end of Shellog.sh script
	perl -pe 's/\e\[\?2004[hl]//g; s/\e\]0;.*?\a//g; s/\x07//g; s/\r//g' "${log_file%.log}.log" >> "${log_file%.log}.txt"

    fi
done < <(find "$BASE_DIR" -type f -name "*.log")

exit 0
