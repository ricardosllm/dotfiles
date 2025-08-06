{ config, pkgs, ... }:

{
  imports = [
    ../modules/neovim
    ../modules/shell.nix
    ../modules/git.nix
    ../modules/browsers.nix
  ];

  home.username = "ricardo-personal";
  home.homeDirectory = "/Users/ricardo-personal";
  
  # Personal-specific configurations
  programs.git = {
    userName = "Ricardo Mota";
    userEmail = "ricardo@personal.email";  # Update with your personal email
    
    extraConfig = {
      github.user = "ricardosllm";
      credential.helper = "osxkeychain";
    };
  };

  # Personal-specific environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "brave";
    PERSONAL_ENV = "true";
  };

  # Personal-specific packages
  home.packages = with pkgs; [
    # Entertainment
    spotify
    vlc
    
    # Personal development
    nodejs_20
    python311
    
    # CLI tools
    ripgrep
    fd
    fzf
    bat
    eza
    
    # Utilities
    tmux
    htop
    neofetch
  ];

  # Personal profile shell aliases
  programs.zsh.shellAliases = {
    personal = "cd ~/personal";
    projects = "cd ~/personal/projects";
    games = "cd ~/Games";
  };

  # This value determines the Home Manager release
  home.stateVersion = "24.05";
}