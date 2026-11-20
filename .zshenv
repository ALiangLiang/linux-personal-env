# ~/.zshenv
# Loaded for ALL zsh sessions (interactive, non-interactive, scripts, subshells).
# Keep this file fast and never produce output to stdout/stderr.

# ------------------------------------------------------------------------------
# PATH Configuration
# ------------------------------------------------------------------------------
typeset -U path PATH # Keep entries unique

# User local bins
[ -d "$HOME/.local/bin" ] && path=("$HOME/.local/bin" $path)
[ -d "$HOME/bin" ] && path=("$HOME/bin" $path)

# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm/bin"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ------------------------------------------------------------------------------
# Node Version Manager (NVM)
# ------------------------------------------------------------------------------
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ------------------------------------------------------------------------------
# Machine-specific environment overrides (if available)
# ------------------------------------------------------------------------------
[ -f ~/.zshenv.local ] && source ~/.zshenv.local
