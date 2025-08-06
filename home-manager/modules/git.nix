{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    # User configuration set in profiles
    
    aliases = {
      # Status
      s = "status";
      st = "status";
      
      # Add
      a = "add";
      aa = "add --all";
      ap = "add --patch";
      
      # Commit
      c = "commit";
      cm = "commit -m";
      ca = "commit --amend";
      can = "commit --amend --no-edit";
      
      # Branch
      b = "branch";
      ba = "branch -a";
      bd = "branch -d";
      bD = "branch -D";
      
      # Checkout
      co = "checkout";
      cob = "checkout -b";
      
      # Pull/Push
      pl = "pull";
      plr = "pull --rebase";
      ps = "push";
      psf = "push --force-with-lease";
      
      # Diff
      d = "diff";
      ds = "diff --staged";
      
      # Log
      l = "log --oneline --graph --decorate";
      la = "log --oneline --graph --decorate --all";
      ll = "log --pretty=format:'%C(yellow)%h%Creset %ad | %s%d [%an]' --graph --date=short";
      
      # Stash
      stl = "stash list";
      sta = "stash apply";
      std = "stash drop";
      stp = "stash pop";
      sts = "stash save";
      
      # Remote
      r = "remote";
      rv = "remote -v";
      
      # Rebase
      rb = "rebase";
      rbi = "rebase -i";
      rbc = "rebase --continue";
      rba = "rebase --abort";
    };
    
    extraConfig = {
      core = {
        editor = "nvim";
        autocrlf = "input";
      };
      
      init = {
        defaultBranch = "main";
      };
      
      pull = {
        rebase = true;
      };
      
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      
      merge = {
        tool = "nvim";
      };
      
      diff = {
        tool = "nvim";
      };
      
      color = {
        ui = true;
      };
    };
    
    ignores = [
      # macOS
      ".DS_Store"
      "*.swp"
      
      # IDE
      ".idea/"
      ".vscode/"
      "*.iml"
      
      # Node
      "node_modules/"
      "npm-debug.log*"
      "yarn-debug.log*"
      "yarn-error.log*"
      
      # Python
      "__pycache__/"
      "*.pyc"
      ".pytest_cache/"
      "venv/"
      ".venv/"
      
      # Rust
      "target/"
      "Cargo.lock"
      
      # Nix
      "result"
      "result-*"
      
      # Env files
      ".env"
      ".env.local"
      ".env.*.local"
    ];
  };
}