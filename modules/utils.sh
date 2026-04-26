#!/bin/bash

# Utility and Backup Manager
BACKUP_DIR="../backups"

backup_project() {
    local timestamp=$(date +%Y%m%d_%H%M%S)
    echo "Select backup format:"
    echo "1) tar.gz"
    echo "2) zip"
    read -p "Choice: " f_choice
    
    if [ "$f_choice" == "2" ]; then
        local filename="linux_diary_backup_$timestamp.zip"
        zip -r "$BACKUP_DIR/$filename" ../data ../core ../modules ../reports -x "*.tar.gz"
    else
        local filename="linux_diary_backup_$timestamp.tar.gz"
        tar -czf "$BACKUP_DIR/$filename" -C .. data core modules reports
    fi
    echo "Backup created: $BACKUP_DIR/$filename"
}

restore_project() {
    echo "Available backups:"
    ls "$BACKUP_DIR"
    read -p "Enter backup filename to restore: " filename
    if [ -f "$BACKUP_DIR/$filename" ]; then
        tar -xzf "$BACKUP_DIR/$filename" -C ..
        echo "Project restored from $filename"
    else
        echo "Backup file not found."
    fi
}

init_git() {
    if [ ! -d "../.git" ]; then
        git init ..
        echo "Git repository initialized."
        echo "Creating .gitignore..."
        echo "backups/*.tar.gz" > "../.gitignore"
        echo "data/.current_session" >> "../.gitignore"
    else
        echo "Git is already initialized."
    fi
}

auto_commit() {
    git -C .. add .
    git -C .. commit -m "Auto-update: Learning session progress $(date)"
    echo "Changes committed to Git."
}

generate_aliases() {
    local alias_file="../data/generated_aliases.sh"
    echo "# Auto-generated Aliases based on Library" > "$alias_file"
    tail -n +2 "../data/commands.csv" | while IFS='|' read -r cmd cat tags diff desc; do
        # Example: alias l-cmd='cmd'
        echo "alias l-$cmd='$cmd'" >> "$alias_file"
    done
    echo "Aliases generated in $alias_file"
    echo "To use them, run: source $alias_file"
}

# Sub-menu
while true; do
    echo ""
    echo "--- Utilities & Versioning ---"
    echo "1) Create Backup (tar.gz/zip)"
    echo "2) Restore from Backup"
    echo "3) Initialize Git"
    echo "4) Auto-commit changes"
    echo "5) Generate Command Aliases"
    echo "q) Back to Main Menu"
    read -p "Select option: " opt
    case $opt in
        1) backup_project ;;
        2) restore_project ;;
        3) init_git ;;
        4) auto_commit ;;
        5) generate_aliases ;;
        q) break ;;
    esac
done
