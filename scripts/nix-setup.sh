#!/usr/bin/env bash

# Nix-based setup script

set -e

echo "🚀 Starting Nix-based macOS setup..."

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    log_error "This script is designed for macOS only"
    exit 1
fi

# Check if running on Apple Silicon
if [[ $(uname -m) != "arm64" ]]; then
    log_warn "This script is optimized for Apple Silicon (M1/M2) but will attempt to continue"
fi

log_info "Nix: check and install if needed"
if ! command -v nix &> /dev/null; then
    log_info "Installing Nix package manager..."
    sh <(curl -L https://nixos.org/nix/install) --daemon

    # Source Nix
    source /etc/profile

    log_info "Nix installed successfully"
else
    log_info "Nix is already installed"
fi

log_info "Configuring Nix with experimental features..."
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

log_info "Homebrew: check and install if needed"
if ! command -v brew &> /dev/null; then
    log_info "Installing Homebrew for GUI applications..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    log_info "Homebrew is already installed"
fi

# Build and switch to the Nix configuration
log_info "Building and switching to Nix configuration..."
cd ~/code/dotfiles

# Initialize flake if lock file doesn't exist
if [ ! -f "flake.lock" ]; then
    log_info "Initializing flake..."
    nix flake update
fi

log_info "Installing packages via Homebrew..."
brew bundle install --file=/dev/stdin <<EOF
brew "ripgrep"
brew "neovim"
brew "lazygit"
brew "rustup"
EOF

log_info "Installing GUI applications via Homebrew..."
brew bundle install --file=/dev/stdin <<EOF
cask "arc"
cask "firefox"
cask "brave-browser"
cask "docker"
cask "iterm2"
cask "jetbrains-toolbox"
cask "karabiner-elements"
cask "font-hack-nerd-font"
cask "claude"
cask "pop-app"
cask "1password"
cask "slack"
cask "notion"
cask "zoom"
cask "discord"
cask "whatsapp"
EOF

log_info "Install lunarVim"
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

log_info "Setup iTerm2 preferences (if they exist)"
if [ -d "iterm2_profile" ]; then
    log_info "Configuring iTerm2..."
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder "~/code/dotfiles/iterm2_profile"
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
fi

log_info "Creating directory structure..."
mkdir -p ~/gini

log_info "Setup SSH"
cat > ~/.ssh/config << 'EOF'
Host github.com-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/vm-max

Host github.com-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/ricardosllm-max
EOF

log_info "Configuring Git..."
git config --global user.name "Ricardo Mota"
git config --global user.email "ricardo@verifiedmetrics.com"
git config --global core.editor "nvim"
git config --global init.defaultBranch "master"
git config --global pull.rebase true
git config --global push.autoSetupRemote true

# log_info "Building Claude Code sandbox Docker image..."
# if command -v docker &> /dev/null; then
#    docker build -t claude-sandbox:latest ~/code/dotfiles/templates/docker/claude-sandbox/
# else
#    log_warn "Docker not found. Please install Docker Desktop and run: docker build -t claude-sandbox:latest ~/code/dotfiles/templates/docker/claude-sandbox/"
# fi
