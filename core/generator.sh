#!/bin/bash

# Dynamic Diary Generator
DATA_DIR="../data"
OUTPUT_FILE="../tech_diary.txt"
PROFILE_FILE="$DATA_DIR/profile.txt"
COMMANDS_FILE="$DATA_DIR/commands.csv"
LOG_FILE="$DATA_DIR/execution_log.csv"

generate_diary() {
    echo "==========================================" > "$OUTPUT_FILE"
    echo "   LINUX LEARNING ASSISTANT - TECH DIARY  " >> "$OUTPUT_FILE"
    echo "==========================================" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Profile Section
    echo "[ USER PROFILE ]" >> "$OUTPUT_FILE"
    while IFS='=' read -r key value; do
        printf "%-15s: %s\n" "$key" "$value" >> "$OUTPUT_FILE"
    done < "$PROFILE_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Command Library Section
    echo "[ FAVORITE COMMANDS LIBRARY ]" >> "$OUTPUT_FILE"
    echo "------------------------------------------" >> "$OUTPUT_FILE"
    printf "%-10s | %-15s | %-10s | %s\n" "Command" "Category" "Difficulty" "Description" >> "$OUTPUT_FILE"
    echo "------------------------------------------" >> "$OUTPUT_FILE"
    tail -n +2 "$COMMANDS_FILE" | while IFS='|' read -r cmd cat tags diff desc; do
        printf "%-10s | %-15s | %-10s | %s\n" "$cmd" "$cat" "$diff" "$desc" >> "$OUTPUT_FILE"
    done
    echo "" >> "$OUTPUT_FILE"

    # Execution Log Summary
    echo "[ RECENT ACTIVITY LOG ]" >> "$OUTPUT_FILE"
    echo "------------------------------------------" >> "$OUTPUT_FILE"
    if [ -f "$LOG_FILE" ]; then
        tail -n 10 "$LOG_FILE" | tail -n +2 | while IFS='|' read -r ts cmd status sid notes; do
            echo "[$ts] $cmd -> $status ($notes)" >> "$OUTPUT_FILE"
        done
    else
        echo "No execution logs found." >> "$OUTPUT_FILE"
    fi
    echo "" >> "$OUTPUT_FILE"

    echo "Diary generated at $(date)" >> "$OUTPUT_FILE"
    echo "Output saved to $OUTPUT_FILE"
}

generate_diary
