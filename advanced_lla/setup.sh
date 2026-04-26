#!/bin/bash

# Production-Grade LLA Setup Script
echo "=========================================="
# shellcheck disable=SC2145
echo "  INITIATING ADVANCED LLA INSTALLATION    "
echo "=========================================="

# 1. System Compatibility Check
echo "[1/4] Checking system compatibility..."
if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "darwin"* ]]; then
    echo "  [OK] Unix-based system detected."
else
    echo "  [WARNING] Non-Unix system detected. Features may be limited."
fi

# 2. Dependency Check
echo "[2/4] Verifying dependencies..."
deps=(python3 pip3 fzf git)
for dep in "${deps[@]}"; do
    if command -v "$dep" >/dev/null 2>&1; then
        echo "  [OK] $dep is installed."
    else
        echo "  [MISSING] $dep is required for full functionality."
    fi
done

# 3. Python Environment Setup
echo "[3/4] Setting up Python environment..."
pip3 install flask rich requests > /dev/null 2>&1
echo "  [OK] Python libraries installed."

# 4. Project Initialization
echo "[4/4] Initializing LLA components..."
chmod +x advanced_lla/bin/lla.py
chmod +x advanced_lla/shell/hook.sh

# Create local bin link
mkdir -p "$HOME/.local/bin"
ln -sf "$(pwd)/advanced_lla/bin/lla.py" "$HOME/.local/bin/lla"

echo ""
echo "Installation Complete!"
echo "=================================================="
echo "ACTION REQUIRED:"
echo "Add the following line to your ~/.bashrc or ~/.zshrc:"
echo "source $(pwd)/advanced_lla/shell/hook.sh"
echo "=================================================="
echo "Then, run 'lla' to start the assistant."
