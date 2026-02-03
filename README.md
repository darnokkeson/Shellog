Shellog 
Shellog is a lightweight tool designed to record entire terminal sessions (both input and output). It was created out of a need to track system changes and debug errors caused by complex commands or kernel interactions.
Unlike the standard .bash_history, which only saves commands, Shellog captures everything you see on your screen.
Features

    Full Session Recording: Saves both what you type and what the system returns.
    Automated Logging: Starts automatically every time you open your terminal.
    Self-Healing: If your system crashes or the terminal is killed, a "Healing" script recovers missing text logs from binary data on the next startup.
    Auto-Cleanup: Automatically removes logs older than 90 days to save disk space.
    Clean Output: Uses Perl filters to strip terminal escape codes (garbage characters), making the .txt logs easy to read.

Installation
1. Place the files
The script is configured to run from the /opt directory. Move the Shellog folder there:
bash

sudo mv Shellog /opt/

Używaj kodu z rozwagą.
2. Set Permissions
Navigate to the directory and make the scripts executable:
bash

cd /opt/Shellog
chmod +x Shellog.sh src/Healing.sh src/Cleanup.sh

Używaj kodu z rozwagą.
3. Integrate with Bash
To start recording automatically, add the following snippet to the bottom of your ~/.bashrc file:
bash

# SHELLOG - Terminal Session Recorder
if [ -z "$TERMINAL_RECORDING" ]; then
    export TERMINAL_RECORDING=1
    /opt/Shellog/Shellog.sh
    exit
fi

Używaj kodu z rozwagą.
Apply the changes immediately:
bash

source ~/.bashrc

Używaj kodu z rozwagą.
How it works

    Logs Location: All recordings are stored in $HOME/Shellog/Logs/.
    Directory Structure: Logs are organized by date (e.g., ~/Shellog/Logs/20231027/).
    File Formats:
        .log: Raw session data.
        .txt: Cleaned, human-readable version.

Viewing Logs
For the best experience, use less -R to view the .txt files. This flag preserves terminal colors while keeping the text readable:
bash

less -R ~/Shellog/Logs/YYYYMMDD/filename.txt

Używaj kodu z rozwagą.
Project Structure

    Shellog.sh: The main entry point that initializes the session.
    src/Healing.sh: Checks for interrupted sessions and converts orphaned .log files to .txt.
    src/Cleanup.sh: Deletes logs older than 90 days.
