export EDITOR="code --wait"
export VISUAL="$EDITOR"

# Dotfiles bin
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd)"
if [[ -d "$DOTFILES_DIR/bin" ]]; then
  export PATH="$DOTFILES_DIR/bin:$PATH"
fi

# Aliases
if [[ -f "$HOME/.bash_aliases" ]]; then
  source "$HOME/.bash_aliases"
fi
