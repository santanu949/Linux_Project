#!/bin/bash

# Enhanced Logging System for Linux Learning Assistant
LOG_FILE="../data/execution_log.csv"
SESSION_FILE="../data/.current_session"

# Initialize log file if it doesn't exist
if [ ! -f "$LOG_FILE" ]; then
    echo "timestamp|command|status|session_id|notes" > "$LOG_FILE"
fi

# Get or create session ID
if [ ! -f "$SESSION_FILE" ]; then
    echo "SESSION_$(date +%Y%m%d_%H%M%S)" > "$SESSION_FILE"
fi
SESSION_ID=$(cat "$SESSION_FILE")

log_command() {
    local cmd="$1"
    local status="$2"
    local notes="$3"
    local ts=$(date "+%Y-%m-%d %H:%M:%S")
    
    echo "$ts|$cmd|$status|$SESSION_ID|$notes" >> "$LOG_FILE"
}

# Simple interactive wrapper
interactive_log() {
    read -p "Enter command executed: " cmd
    read -p "Success? (y/n): " success
    [[ "$success" == "y" ]] && status="SUCCESS" || status="FAILURE"
    read -p "Notes/Reflections: " notes
    
    log_command "$cmd" "$status" "$notes"
    echo "Command logged successfully."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    interactive_log
fi
