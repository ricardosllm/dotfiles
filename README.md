# Ricardo's Dotfiles - M1 Max MacBook Pro Configuration

A complete Nix-based configuration for macOS development environment with work/personal profile separation, vim keybindings everywhere, and Claude Code sandbox support.

## Features

- **Nix + nix-darwin**: Declarative system configuration
- **Home Manager**: User environment management
- **Dual Profiles**: Separate work and personal user accounts
- **Neovim + LazyVim**: Modern vim setup with LSP support
- **Claude Code Sandbox**: Docker-based isolation for AI code execution
- **Vim Everywhere**: Karabiner-Elements + Vimium for system-wide vim keybindings

## Quick Start

### Initial Setup

```bash
# Clone the repository
mkdir -p ~/code
git clone https://github.com/ricardosllm/dotfiles ~/code/dotfiles
cd ~/code/dotfiles

# Run the setup script
./scripts/nix-setup.sh
```

### Manual Setup Steps

1. **Install Nix**:
```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
source /etc/profile
```

2. **Enable Flakes**:
```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

3. **Build Configuration**:
```bash
cd ~/code/dotfiles
nix flake update
darwin-rebuild switch --flake .
```

## Directory Structure

```
dotfiles/
├── flake.nix                     # Main Nix configuration
├── darwin/                       # macOS system settings
│   ├── configuration.nix         # System packages and settings
│   └── homebrew.nix             # GUI apps via Homebrew
├── home-manager/                 # User configurations
│   ├── profiles/
│   │   ├── work.nix            # Work profile
│   │   └── personal.nix        # Personal profile
│   └── modules/
│       ├── neovim/              # Neovim + LazyVim
│       ├── shell.nix            # Zsh with vim mode
│       ├── git.nix              # Git configuration
│       ├── development.nix      # Dev tools
│       ├── claude-code.nix      # Claude sandbox
│       └── browsers.nix         # Browser configs
├── scripts/
│   ├── nix-setup.sh            # Initial setup script
│   ├── claude-sandbox.sh       # Launch Claude in Docker
│   └── switch-profile.sh       # Switch user profiles
└── templates/
    └── docker/
        └── claude-sandbox/      # Claude Code container
```

## Daily Usage

### System Management

```bash
# Rebuild after configuration changes
darwin-rebuild switch --flake ~/code/dotfiles

# Update all packages
nix flake update ~/code/dotfiles

# Garbage collection
nix-collect-garbage -d
```

### Claude Code

Launch Claude Code in a sandboxed environment:

```bash
# Start Claude sandbox for current directory
claude

# Or specify project name and path
~/code/dotfiles/scripts/claude-sandbox.sh my-project /path/to/project
```

### Profile Switching

```bash
# Switch to work profile
~/code/dotfiles/scripts/switch-profile.sh work

# Switch to personal profile
~/code/dotfiles/scripts/switch-profile.sh personal
```

## Key Bindings

### Shell (Zsh Vi Mode)
- `ESC`: Enter command mode
- `i`: Enter insert mode
- `hjkl`: Navigate in command mode
- `^R`: History search
- `^P/^N`: Previous/next command

### Neovim (LazyVim)
- `<space>`: Leader key
- `<leader>ff`: Find files
- `<leader>fg`: Live grep
- `<leader>e`: File explorer

### Browsers (Vimium)
- `j/k`: Scroll down/up
- `h/l`: Scroll left/right
- `f`: Open link hints
- `x`: Close tab
- `t`: New tab

## Troubleshooting

### Nix daemon issues after macOS update
```bash
sudo launchctl kickstart -k system/org.nixos.nix-daemon
```

### Reset Nix store permissions
```bash
sudo diskutil enableOwnership /nix
```

### Repair Nix store
```bash
nix-store --repair --verify --check-contents
```

## License

MIT

## Author

Ricardo Mota - [@ricardosllm](https://github.com/ricardosllm)
