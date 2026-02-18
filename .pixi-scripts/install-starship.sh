#!/bin/bash
# install-starship.sh
# Installs starship (if not already present) and sets up config + shell init.
# Safe to run on systems that already have starship — skips any step already done.
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SOURCE="$SCRIPT_DIR/starship.toml"
CONFIG_DIR="$HOME/.config"
CONFIG_TARGET="$CONFIG_DIR/starship.toml"

echo "Setting up Starship prompt..."
echo ""

# 1. Install binary only if not already on PATH
if command -v starship >/dev/null 2>&1; then
    echo "  starship already installed ($(starship --version)) — skipping binary install"
else
    echo "  starship not found — installing via official installer..."
    curl -sS https://starship.rs/install.sh | sh -s -- --yes
    echo "  starship installed to ~/.local/bin"
fi

echo ""

# 2. Copy config only if ~/.config/starship.toml does not exist
mkdir -p "$CONFIG_DIR"
if [ -f "$CONFIG_TARGET" ]; then
    echo "  ~/.config/starship.toml already exists (skipped)"
else
    cp "$CONFIG_SOURCE" "$CONFIG_TARGET"
    echo "  Copied starship.toml to $CONFIG_TARGET"
fi

echo ""

# 3. Add shell init lines only if not already present
inject_starship_init() {
    local RC_FILE="$1"
    local SHELL_NAME="$2"
    local INIT_LINE="eval \"\$(starship init $SHELL_NAME)\""

    [ ! -f "$RC_FILE" ] && touch "$RC_FILE"

    if grep -qF "starship init" "$RC_FILE" 2>/dev/null; then
        echo "  starship init already in $RC_FILE (skipped)"
        return
    fi

    printf '\n# Starship prompt\n' >> "$RC_FILE"
    echo "$INIT_LINE" >> "$RC_FILE"
    echo "  Added starship init to $RC_FILE"
}

inject_starship_init "$HOME/.bashrc" "bash"
inject_starship_init "$HOME/.zshrc" "zsh"

echo ""
echo "Done! Restart your shell or run: source ~/.zshrc"
