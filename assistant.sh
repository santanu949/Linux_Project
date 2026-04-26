#!/bin/bash

# Main Entry Point for Linux Learning Assistant

# Ensure we are in the project root
cd "$(dirname "$0")"

show_menu() {
    clear
    echo "=========================================="
    echo "    LINUX LEARNING ASSISTANT v2.0         "
    echo "=========================================="
    echo "1) Log a Command Execution"
    echo "2) Command Library (Search/Filter/Add)"
    echo "3) Generate Tech Diary"
    echo "4) Analytics & Progress Reports"
    echo "5) Utilities (Backup/Git/Restore)"
    echo "6) Update Profile"
    echo "q) Exit"
    echo "=========================================="
}

while true; do
    show_menu
    read -p "Select an option: " choice
    case $choice in
        1) bash core/logger.sh ;;
        2) bash modules/command_manager.sh ;;
        3) bash core/generator.sh && echo "Diary updated!" && sleep 2 ;;
        4) bash modules/stats.sh ;;
        5) bash modules/utils.sh ;;
        6) nano data/profile.txt ;;
        q) echo "Happy learning!"; exit 0 ;;
        *) echo "Invalid option"; sleep 1 ;;
    esac
done
