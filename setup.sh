#!/bin/bash

# Setup and Initialization Script
echo "Initializing Linux Learning Assistant..."

# 1. Create necessary directories if missing
mkdir -p core data modules reports backups

# 2. Set executable permissions for all scripts
chmod +x assistant.sh
chmod +x core/*.sh
chmod +x modules/*.sh

# 3. Check for dependencies
echo "Checking dependencies..."
deps=(bash grep awk tar git)
for dep in "${deps[@]}"; do
    if command -v "$dep" >/dev/null 2>&1; then
        echo "[OK] $dep is installed."
    else
        echo "[WARNING] $dep is NOT installed. Some features may not work."
    fi
done

# 4. Initialize session
echo "SESSION_$(date +%Y%m%d_%H%M%S)" > data/.current_session

echo ""
echo "Setup Complete!"
echo "To start the assistant, run: ./assistant.sh"
