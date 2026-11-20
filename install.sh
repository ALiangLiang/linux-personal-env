#!/usr/bin/env bash
set -e

# ==============================================================================
# Linux Personal Environment Bootstrap & Installer
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/ALiangLiang/linux-personal-env/master/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/ALiangLiang/linux-personal-env/master/install.sh | bash -s -- zsh vim
#   ./install.sh [--all|zsh|tmux|vim]
# ==============================================================================

REPO_URL="https://github.com/ALiangLiang/linux-personal-env.git"
DEFAULT_TARGET_DIR="$HOME/.linux-personal-env"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${BLUE}[INFO]${NC} $*"; }
success(){ echo -e "${GREEN}[OK]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*"; }

# 1. Determine Dotfiles Directory
# If running locally from a git repo clone:
if [ -n "${BASH_SOURCE[0]}" ] && [ -d "$(dirname "${BASH_SOURCE[0]}")/.git" ]; then
    DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    info "Running from local repository: $DOTFILES_DIR"
else
    DOTFILES_DIR="${DOTFILES_DIR:-$DEFAULT_TARGET_DIR}"
    if [ -d "$DOTFILES_DIR/.git" ]; then
        info "Updating existing dotfiles repo at $DOTFILES_DIR..."
        git -C "$DOTFILES_DIR" pull --rebase
    else
        info "Cloning dotfiles repository to $DOTFILES_DIR..."
        command -v git >/dev/null 2>&1 || {
            error "git is not installed. Please install git first."
            exit 1
        }
        git clone "$REPO_URL" "$DOTFILES_DIR"
    fi
fi

# Helper: Safely backup and symlink
backup_and_link() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        # Check if already points to source
        if [ "$(readlink -f "$dest" 2>/dev/null)" = "$(readlink -f "$src")" ]; then
            info "Already linked: $dest -> $src"
            return 0
        fi
        local backup="${dest}.bak.$(date +%Y%m%d%H%M%S)"
        warn "Existing $dest found. Backing up to $backup"
        mv "$dest" "$backup"
    fi

    ln -snf "$src" "$dest"
    success "Linked $dest -> $src"
}

# ------------------------------------------------------------------------------
# ZSH Setup
# ------------------------------------------------------------------------------
setup_zsh() {
    info "Setting up Zsh environment..."
    if ! command -v zsh >/dev/null 2>&1; then
        warn "zsh is not installed. Attempting installation or please install zsh."
        if command -v apt-get >/dev/null 2>&1; then
            sudo apt-get update && sudo apt-get install -y zsh
        fi
    fi

    # Install Oh My Zsh if not present
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        info "Installing Oh My Zsh (non-interactive)..."
        RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ""
    else
        info "Oh My Zsh already installed."
    fi

    backup_and_link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    success "Zsh setup completed."
}

# ------------------------------------------------------------------------------
# TMUX Setup
# ------------------------------------------------------------------------------
setup_tmux() {
    info "Setting up Tmux environment..."
    if ! command -v tmux >/dev/null 2>&1; then
        warn "tmux is not installed. Attempting installation or please install tmux."
        if command -v apt-get >/dev/null 2>&1; then
            sudo apt-get update && sudo apt-get install -y tmux
        fi
    fi

    # Clone gpakosz/.tmux if not present
    if [ ! -d "$HOME/.tmux" ]; then
        info "Cloning gpakosz/.tmux framework..."
        git clone https://github.com/gpakosz/.tmux.git "$HOME/.tmux"
    else
        info "Updating $HOME/.tmux..."
        git -C "$HOME/.tmux" pull --rebase || true
    fi

    ln -snf "$HOME/.tmux/.tmux.conf" "$HOME/.tmux.conf"
    backup_and_link "$DOTFILES_DIR/.tmux.conf.local" "$HOME/.tmux.conf.local"
    success "Tmux setup completed."
}

# ------------------------------------------------------------------------------
# VIM Setup
# ------------------------------------------------------------------------------
setup_vim() {
    info "Setting up Vim environment..."
    if ! command -v vim >/dev/null 2>&1; then
        warn "vim is not installed. Attempting installation or please install vim."
        if command -v apt-get >/dev/null 2>&1; then
            sudo apt-get update && sudo apt-get install -y vim
        fi
    fi

    # Install vim-plug
    info "Installing vim-plug..."
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    backup_and_link "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"

    info "Installing Vim plugins via vim-plug..."
    vim +PlugInstall +qall </dev/null >/dev/null 2>&1 || true
    success "Vim setup completed."
}

# ------------------------------------------------------------------------------
# Entry Point
# ------------------------------------------------------------------------------
main() {
    local targets=("$@")
    if [ ${#targets[@]} -eq 0 ]; then
        targets=("--all")
    fi

    for target in "${targets[@]}"; do
        case "$target" in
            --all|all)
                setup_zsh
                setup_tmux
                setup_vim
                ;;
            zsh)
                setup_zsh
                ;;
            tmux)
                setup_tmux
                ;;
            vim)
                setup_vim
                ;;
            -h|--help)
                echo "Usage: $0 [all|zsh|tmux|vim]"
                exit 0
                ;;
            *)
                warn "Unknown target: $target. Ignored."
                ;;
        esac
    done

    echo ""
    success "All selected configurations installed successfully!"
    info "To apply zsh changes immediately, run: exec zsh"
}

main "$@"
