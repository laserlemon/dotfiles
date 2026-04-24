#!/usr/bin/env bash
#
# install.sh — Codespace bootstrap for laserlemon/dotfiles
#
# GitHub Codespaces clones your dotfiles repo and runs install.sh automatically.
# See: https://docs.github.com/en/codespaces/setting-your-minimum-specification/personalizing-codespaces-for-your-account

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "→ Installing dotfiles from $DOTFILES_DIR"

# Shell config
for f in .bashrc .bash_aliases .gitignore; do
  if [[ -f "$DOTFILES_DIR/$f" ]]; then
    ln -sf "$DOTFILES_DIR/$f" "$HOME/$f"
    echo "  ✓ ~/$f"
  fi
done

# Add bin/ to PATH (idempotent)
chmod +x "$DOTFILES_DIR/bin/"* 2>/dev/null || true
PATHLINE="export PATH=\"$DOTFILES_DIR/bin:\$PATH\""
if ! grep -qF "$DOTFILES_DIR/bin" "$HOME/.bashrc" 2>/dev/null; then
  echo "$PATHLINE" >> "$HOME/.bashrc"
  echo "  ✓ Added bin/ to PATH"
fi

# VS Code custom instructions (prompts directory)
PROMPTS_DIR="$HOME/.config/Code/User/prompts"
if [[ -d "$HOME/Library/Application Support/Code/User" ]]; then
  PROMPTS_DIR="$HOME/Library/Application Support/Code/User/prompts"
fi
mkdir -p "$PROMPTS_DIR"
ln -sf "$DOTFILES_DIR/journal.instructions.md" "$PROMPTS_DIR/journal.instructions.md"
echo "  ✓ $PROMPTS_DIR/journal.instructions.md"

echo "→ Done. Restart your shell or run: source ~/.bashrc"
