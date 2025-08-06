{ config, pkgs, ... }:

{
  # Development tools and configurations
  home.packages = with pkgs; [
    # Build tools
    gnumake
    cmake
    pkg-config
    
    # Language servers and tools
    gopls
    golangci-lint
    
    # Database clients
    postgresql
    redis
    sqlite
    
    # HTTP tools
    curl
    wget
    httpie
    
    # JSON/YAML tools
    jq
    yq-go
    
    # Container tools
    docker-compose
    lazydocker
    dive  # Docker image explorer
    
    # Monitoring
    htop
    btop
    ncdu
    
    # Network tools
    nmap
    netcat
    
    # Text processing
    ripgrep
    sd  # find and replace
    fd
    bat
    eza
    
    # Development utilities
    gh  # GitHub CLI
    glab  # GitLab CLI
    tig  # Git TUI
    lazygit
    
    # Code analysis
    tokei  # Count lines of code
    hyperfine  # Benchmarking
    
    # Terminal multiplexer
    tmux
  ];
  
  # Tmux configuration
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    keyMode = "vi";
    
    extraConfig = ''
      # Set prefix to Ctrl-a
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix
      
      # Split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %
      
      # Vim-style pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      
      # Vim-style pane resizing
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
      
      # Enable mouse mode
      set -g mouse on
      
      # Don't rename windows automatically
      set-option -g allow-rename off
      
      # Status bar
      set -g status-position bottom
      set -g status-bg colour234
      set -g status-fg colour137
      set -g status-left ""
      set -g status-right '#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S '
      set -g status-right-length 50
      set -g status-left-length 20
    '';
  };
}