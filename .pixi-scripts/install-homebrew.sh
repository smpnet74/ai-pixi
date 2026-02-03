#!/bin/bash
set -e

echo "Installing Homebrew..."

# Run the Homebrew installer
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Set up shell configuration
SHELL_RC="$HOME/.zshrc"

# Add section header if not exists
if ! grep -qF "# Homebrew" "$SHELL_RC" 2>/dev/null; then
    echo "" >> "$SHELL_RC"
    echo "# Homebrew" >> "$SHELL_RC"
fi

# Add eval line if not exists
if ! grep -qF 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"' "$SHELL_RC" 2>/dev/null; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"' >> "$SHELL_RC"
    echo "✓ Added Homebrew to PATH in $SHELL_RC"
fi

# Verify installation
if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
    /home/linuxbrew/.linuxbrew/bin/brew --version
    echo "✓ Homebrew installed successfully!"
    echo "→ Run: source ~/.zshrc"
else
    echo "✗ Homebrew installation failed"
    exit 1
fi
