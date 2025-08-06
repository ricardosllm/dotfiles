{ config, pkgs, ... }:

{
  # System packages (available to all users)
  environment.systemPackages = with pkgs; [
    # Core tools
    vim
    git
    curl
    wget
    htop
    
    # Development
    docker
    docker-compose
    
    # Nix tools
    nixpkgs-fmt
    nil  # Nix LSP
    
    # Security
    gnupg
    openssh
  ];

  # macOS system settings
  system.defaults = {
    # Dock
    dock = {
      autohide = true;
      show-recents = false;
      launchanim = false;
      orientation = "bottom";
      tilesize = 48;
    };
    
    # Finder
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      QuitMenuItem = true;
      ShowPathbar = true;
    };
    
    # System
    NSGlobalDomain = {
      AppleKeyboardUIMode = 3;
      ApplePressAndHoldEnabled = false;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
  };

  # Enable Touch ID for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # Nix configuration
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "ricardo-work" "ricardo-personal" ];
      max-jobs = 8;  # Utilize M1 Max cores
    };
    
    # Garbage collection
    gc = {
      automatic = true;
      interval = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # Enable daemon
  services.nix-daemon.enable = true;
  
  # System state version (don't change)
  system.stateVersion = 4;
}