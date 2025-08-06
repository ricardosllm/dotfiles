#!/usr/bin/env bash

# Nix-based setup script for Ricardo's M1 Max MacBook
# This replaces the old Homebrew-based setup

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

# Step 1: Install Nix if not already installed
if ! command -v nix &> /dev/null; then
    log_info "Installing Nix package manager..."
    sh <(curl -L https://nixos.org/nix/install) --daemon
    
    # Source Nix
    source /etc/profile
    
    log_info "Nix installed successfully"
else
    log_info "Nix is already installed"
fi

# Step 2: Enable experimental features
log_info "Configuring Nix with experimental features..."
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

# Step 3: Install nix-darwin if not already installed
if ! command -v darwin-rebuild &> /dev/null; then
    log_info "Installing nix-darwin..."
    nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
    ./result/bin/darwin-installer
    rm -rf result
else
    log_info "nix-darwin is already installed"
fi

# Step 4: Install Homebrew (still needed for GUI apps via Cask)
if ! command -v brew &> /dev/null; then
    log_info "Installing Homebrew for GUI applications..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    log_info "Homebrew is already installed"
fi

# Step 5: Build and switch to the Nix configuration
log_info "Building and switching to Nix configuration..."
cd ~/dotfiles

# Initialize flake if lock file doesn't exist
if [ ! -f "flake.lock" ]; then
    log_info "Initializing flake..."
    nix flake update
fi

# Build and switch
log_info "Applying system configuration..."
darwin-rebuild switch --flake .

# Step 6: Install Homebrew casks (GUI apps)
log_info "Installing GUI applications via Homebrew..."
brew bundle install --file=/dev/stdin <<EOF
cask "arc"
cask "firefox"
cask "brave-browser"
cask "visual-studio-code"
cask "docker"
cask "iterm2"
cask "alfred"
cask "rectangle"
cask "karabiner-elements"
cask "1password"
cask "slack"
cask "zoom"
cask "steam"
cask "discord"
cask "the-unarchiver"
cask "appcleaner"
cask "font-jetbrains-mono-nerd-font"
cask "font-fira-code-nerd-font"
EOF

# Step 7: Setup iTerm2 preferences (if they exist)
if [ -d "iterm2_profile" ]; then
    log_info "Configuring iTerm2..."
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder "$PWD/iterm2_profile"
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
fi

# Step 8: Setup Rectangle preferences
if [ -f "com.knollsoft.Rectangle.plist" ]; then
    log_info "Configuring Rectangle window manager..."
    cp com.knollsoft.Rectangle.plist ~/Library/Preferences/
fi

# Step 9: Create work and personal directories
log_info "Creating directory structure..."
mkdir -p ~/work/gini
mkdir -p ~/personal/projects
mkdir -p ~/Games/Steam

# Step 10: Setup SSH keys
log_info "Setting up SSH keys..."
if [ ! -f ~/.ssh/id_ed25519_work ]; then
    ssh-keygen -t ed25519 -C "ricardo@gini.work" -f ~/.ssh/id_ed25519_work -N ""
fi

if [ ! -f ~/.ssh/id_ed25519_personal ]; then
    read -p "Enter your personal email: " personal_email
    ssh-keygen -t ed25519 -C "$personal_email" -f ~/.ssh/id_ed25519_personal -N ""
fi

# Create SSH config
cat > ~/.ssh/config << 'EOF'
Host github.com-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work

Host github.com-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal
EOF

# Step 11: Setup Git configuration
log_info "Configuring Git..."
git config --global user.name "Ricardo Mota"
git config --global user.email "ricardo@gini.work"
git config --global core.editor "nvim"
git config --global init.defaultBranch "main"
git config --global pull.rebase true
git config --global push.autoSetupRemote true

# Step 12: Build Claude Code Docker image
log_info "Building Claude Code sandbox Docker image..."
if command -v docker &> /dev/null; then
    docker build -t claude-sandbox:latest ~/dotfiles/templates/docker/claude-sandbox/
else
    log_warn "Docker not found. Please install Docker Desktop and run: docker build -t claude-sandbox:latest ~/dotfiles/templates/docker/claude-sandbox/"
fi

# Step 13: Install Rosetta 2 for x86 compatibility (for Steam games)
log_info "Installing Rosetta 2 for x86 compatibility..."
softwareupdate --install-rosetta --agree-to-license || true

# Final message
echo ""
echo "=================================================================================="
echo ""
log_info "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source /etc/profile"
echo "2. Create user accounts if not already done:"
echo "   - ricardo-work (Administrator)"
echo "   - ricardo-personal (Standard)"
echo "3. Configure Karabiner-Elements for vim keybindings everywhere"
echo "4. Import Vimium configuration from ~/.config/vimium/vimium-config.json"
echo "5. Add SSH keys to GitHub:"
echo "   - Work: cat ~/.ssh/id_ed25519_work.pub"
echo "   - Personal: cat ~/.ssh/id_ed25519_personal.pub"
echo ""
echo "To rebuild configuration after changes:"
echo "  darwin-rebuild switch --flake ~/dotfiles"
echo ""
echo "To update packages:"
echo "  nix flake update ~/dotfiles"
echo ""
echo "=================================================================================="