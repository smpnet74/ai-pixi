#!/bin/bash
# ensure-shell-hook.sh
# Adds pixi shell-hook eval lines to ~/.bashrc and ~/.zshrc so all pixi-managed
# tools are available from any shell session without "pixi shell" or aliases.
set -e

MANIFEST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST="$MANIFEST_DIR/pixi.toml"

if [ ! -f "$MANIFEST" ]; then
    echo "ERROR: Cannot find pixi.toml at $MANIFEST_DIR"; exit 1
fi

SECTION_MARKER="# AI-Pixi Shell Hook"
LOCAL_BIN_LINE='export PATH="$HOME/.local/bin:$HOME/.pixi/bin:$PATH"'

inject_into_rc() {
    local RC_FILE="$1"
    local SHELL_NAME="$2"
    local HOOK_LINE="eval \"\$(pixi shell-hook --shell $SHELL_NAME --manifest-path $MANIFEST 2>/dev/null)\""

    [ ! -f "$RC_FILE" ] && touch "$RC_FILE"

    if grep -qF "$SECTION_MARKER" "$RC_FILE" 2>/dev/null; then
        echo "  Shell hook already present in $RC_FILE (skipped)"
        return
    fi

    printf '\n%s\n' "$SECTION_MARKER" >> "$RC_FILE"
    echo "$LOCAL_BIN_LINE" >> "$RC_FILE"
    echo "$HOOK_LINE" >> "$RC_FILE"
    echo "  Added pixi shell hook to $RC_FILE"
}

echo "Setting up AI-Pixi shell hooks..."
echo ""
inject_into_rc "$HOME/.bashrc" "bash"
inject_into_rc "$HOME/.zshrc" "zsh"
echo ""
echo "Done! Restart your shell or run: source ~/.zshrc"
