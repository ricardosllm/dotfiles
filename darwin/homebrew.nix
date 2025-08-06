{ config, ... }:

{
  homebrew = {
    enable = true;
    
    # Auto update & cleanup
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    
    # Taps
    taps = [
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/services"
    ];
    
    # GUI Applications (Casks)
    casks = [
      # Browsers
      "arc"
      "firefox"
      "brave-browser"
      
      # Development
      "visual-studio-code"  # Backup editor
      "docker"
      "iterm2"
      
      # Productivity
      "alfred"
      "rectangle"  # Window management
      "karabiner-elements"  # Vim keybindings everywhere
      "1password"
      
      # Communication
      "slack"
      "zoom"
      
      # Personal/Gaming
      "steam"
      "discord"
      
      # Utilities
      "the-unarchiver"
      "appcleaner"
      
      # Fonts
      "font-jetbrains-mono-nerd-font"
      "font-fira-code-nerd-font"
    ];
  };
}