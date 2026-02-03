# Shellog

Shellog is a tool for automated recording of entire shell sessions (both input commands and their output). The project was created because the standard Bash history (.bash_history) does not record system responses, which is crucial for debugging and learning Linux administration.

## Features
- Full session recording: Records terminal input and output in real-time.
- Automation: Starts automatically every time a shell is opened.
- Healing Mechanism: Recovers missing text files after a system crash or sudden terminal closure.
- Auto-Cleanup: Automatically deletes logs older than 90 days.
- Readability: Uses Perl filters to strip unnecessary terminal control characters from .txt files.

## Installation

1. File Location
The script is configured for the /opt directory. Move the Shellog folder there:
sudo mv Shellog /opt/

2. Permissions
Set execution permissions for the scripts:
cd /opt/Shellog
chmod +x Shellog.sh src/Healing.sh src/Cleanup.sh

3. Autostart Configuration
Add the following block of code to the bottom of your ~/.bashrc file:

# SHELLOG - Program for record entire shell session
if [ -z "$TERMINAL_RECORDING" ]; then
    export TERMINAL_RECORDING=1
    /opt/Shellog/Shellog.sh
    exit
fi

4. Activation
Apply the changes without restarting the terminal:
source ~/.bashrc

## Usage and Logs
- Location: All sessions are stored in the $HOME/Shellog/Logs/ directory.
- Structure: Each day has a separate folder named by date (e.g., 20231027).
- Viewing: It is recommended to use less -R to preserve terminal colors:
less -R ~/Shellog/Logs/DATE/filename.txt

## Project Architecture
- Shellog.sh: Main script managing the session using script -f.
- src/Healing.sh: Repairs orphaned .log files before starting a new session.
- src/Cleanup.sh: Cleanup script for old data (default 90 days).

---
Created to help Linux users keep track of their journey and learn from past mistakes.
