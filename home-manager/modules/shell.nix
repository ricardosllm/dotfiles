{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    # Vim mode
    defaultKeymap = "viins";
    
    # Aliases
    shellAliases = {
      # Navigation
      ll = "ls -la";
      la = "ls -A";
      l = "ls -CF";
      
      # Git
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gpl = "git pull";
      
      # Nix
      rebuild = "darwin-rebuild switch --flake ~/dotfiles";
      update = "nix flake update ~/dotfiles";
      
      # Claude Code
      claude = "~/dotfiles/scripts/claude-sandbox.sh";
      
      # Quick edits
      dots = "cd ~/dotfiles && nvim";
    };
    
    initExtra = ''
      # Enable vim mode indicators
      bindkey -v
      export KEYTIMEOUT=1
      
      # Better history search
      bindkey '^R' history-incremental-search-backward
      bindkey '^P' up-history
      bindkey '^N' down-history
      
      # FZF integration
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh
    '';
  };
  
  programs.starship = {
    enable = true;
    settings = {
      format = "$all$character";
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
        vicmd_symbol = "[⮜](bold green)";
      };
    };
  };
  
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}