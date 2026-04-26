#!/bin/bash

# Advanced LLA Shell Hook
# Source this file in your .bashrc or .zshrc

LLA_BIN="python3 $(pwd)/advanced_lla/bin/lla_log.py"

log_last_command() {
    local exit_code=$?
    local last_cmd=$(history 1 | sed 's/^[ ]*[0-9]*[ ]*//')
    local start_time=${LLA_CMD_START_TIME:-$(date +%s)}
    local end_time=$(date +%s)
    local duration=$((end_time - start_time))
    
    # Avoid logging the logger itself or empty commands
    if [[ -n "$last_cmd" && "$last_cmd" != "lla"* ]]; then
        $LLA_BIN "$last_cmd" "$exit_code" "$duration" "$PWD"
    fi
}

# Bash specific integration
if [ -n "$BASH_VERSION" ]; then
    # Set start time before every command
    trap 'LLA_CMD_START_TIME=$(date +%s)' DEBUG
    # Log after every command
    PROMPT_COMMAND="log_last_command; $PROMPT_COMMAND"
fi
