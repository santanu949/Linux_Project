#!/bin/bash

# Command Library Manager
COMMANDS_FILE="../data/commands.csv"

list_commands() {
    clear
    echo "--- Linux Command Library ---"
    printf "%-10s | %-15s | %-10s | %s\n" "Command" "Category" "Difficulty" "Description"
    echo "--------------------------------------------------------------------------------"
    tail -n +2 "$COMMANDS_FILE" | while IFS='|' read -r cmd cat tags diff desc; do
        printf "%-10s | %-15s | %-10s | %s\n" "$cmd" "$cat" "$diff" "$desc"
    done
}

search_command() {
    read -p "Enter search term (name or category): " term
    clear
    echo "--- Search Results for '$term' ---"
    grep -i "$term" "$COMMANDS_FILE" | while IFS='|' read -r cmd cat tags diff desc; do
        printf "%-10s | %-15s | %-10s | %s\n" "$cmd" "$cat" "$diff" "$desc"
    done
}

filter_by_difficulty() {
    echo "Select Difficulty:"
    echo "1) Beginner"
    echo "2) Intermediate"
    echo "3) Advanced"
    read -p "Choice: " d_choice
    case $d_choice in
        1) diff_val="Beginner" ;;
        2) diff_val="Intermediate" ;;
        3) diff_val="Advanced" ;;
        *) return ;;
    esac
    
    clear
    echo "--- $diff_val Commands ---"
    awk -F'|' -v d="$diff_val" '$4 == d {print $0}' "$COMMANDS_FILE" | while IFS='|' read -r cmd cat tags diff desc; do
        printf "%-10s | %-15s | %-10s | %s\n" "$cmd" "$cat" "$diff" "$desc"
    done
}

add_command() {
    read -p "Command name: " name
    read -p "Category: " cat
    read -p "Tags (comma separated): " tags
    read -p "Difficulty (Beginner/Intermediate/Advanced): " diff
    read -p "Description: " desc
    
    echo "$name|$cat|$tags|$diff|$desc" >> "$COMMANDS_FILE"
    echo "Command added!"
}

# Sub-menu
while true; do
    echo ""
    echo "--- Command Library Menu ---"
    echo "1) List All"
    echo "2) Search"
    echo "3) Filter by Difficulty"
    echo "4) Add New Command"
    echo "q) Back to Main Menu"
    read -p "Select option: " opt
    case $opt in
        1) list_commands ;;
        2) search_command ;;
        3) filter_by_difficulty ;;
        4) add_command ;;
        q) break ;;
    esac
done
