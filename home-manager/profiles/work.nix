{ config, pkgs, ... }:

{
  imports = [
    ../modules/neovim
    ../modules/shell.nix
    ../modules/git.nix
    ../modules/development.nix
    ../modules/claude-code.nix
    ../modules/browsers.nix
  ];

  home.username = "ricardo-work";
  home.homeDirectory = "/Users/ricardo-work";
  
  # Work-specific configurations
  programs.git = {
    userName = "Ricardo Mota";
    userEmail = "ricardo@gini.work";
    
    extraConfig = {
      github.user = "ricardosllm";
      credential.helper = "osxkeychain";
    };
  };

  # Work-specific environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "arc";
    WORK_ENV = "true";
  };

  # Work-specific packages
  home.packages = with pkgs; [
    # Development tools
    nodejs_20
    yarn
    pnpm
    python311
    rustc
    cargo
    go
    
    # CLI tools
    jq
    yq
    ripgrep
    fd
    fzf
    bat
    eza
    tokei
    hyperfine
    
    # Cloud tools
    awscli2
    google-cloud-sdk
    
    # Productivity
    tmux
    direnv
  ];

  # Work profile shell aliases
  programs.zsh.shellAliases = {
    work = "cd ~/work";
    gini = "cd ~/work/gini";
    dotfiles = "cd ~/dotfiles";
  };

  # This value determines the Home Manager release
  home.stateVersion = "24.05";
}