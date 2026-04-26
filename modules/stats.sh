#!/bin/bash

# Analytics and Recommendations
LOG_FILE="../data/execution_log.csv"
COMMANDS_FILE="../data/commands.csv"
REPORTS_DIR="../reports"

generate_report() {
    local report_file="$REPORTS_DIR/learning_report_$(date +%Y%m%d).md"
    echo "# Weekly Linux Learning Report" > "$report_file"
    echo "Generated on: $(date)" >> "$report_file"
    echo "" >> "$report_file"
    
    echo "## Command Usage Frequency" >> "$report_file"
    tail -n +2 "$LOG_FILE" | awk -F'|' '{print $2}' | sort | uniq -c | sort -rn >> "$report_file"
    
    echo "" >> "$report_file"
    echo "## Mastery Progress" >> "$report_file"
    local total_cmds=$(tail -n +2 "$COMMANDS_FILE" | wc -l)
    local used_cmds=$(tail -n +2 "$LOG_FILE" | awk -F'|' '{print $2}' | sort | uniq | wc -l)
    echo "Total Commands in Library: $total_cmds" >> "$report_file"
    echo "Commands Practiced: $used_cmds" >> "$report_file"
    echo "" >> "$report_file"
    
    echo "Report saved to $report_file"
}

recommend_commands() {
    echo "--- Recommendations ---"
    echo "Based on your activity, try practicing these commands:"
    # Find commands in library that are NOT in log
    local practiced=$(tail -n +2 "$LOG_FILE" | awk -F'|' '{print $2}' | sort | uniq)
    tail -n +2 "$COMMANDS_FILE" | while IFS='|' read -r cmd cat tags diff desc; do
        if ! echo "$practiced" | grep -q "^$cmd$"; then
            echo "- $cmd ($diff): $desc"
        fi
    done | head -n 5
}

# Sub-menu
while true; do
    echo ""
    echo "--- Analytics & Progress ---"
    echo "1) Generate Learning Report (Markdown)"
    echo "2) Get Command Recommendations"
    echo "q) Back to Main Menu"
    read -p "Select option: " opt
    case $opt in
        1) generate_report ;;
        2) recommend_commands ;;
        q) break ;;
    esac
done
