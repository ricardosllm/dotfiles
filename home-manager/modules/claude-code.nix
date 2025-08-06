{ config, pkgs, ... }:

{
  # Claude Code configuration for work profile
  # Ensures Claude Code runs in sandboxed Docker containers
  
  home.packages = with pkgs; [
    docker
    docker-compose
  ];

  # Create Claude Code configuration directory
  home.file.".claude-code/config.json".text = ''
    {
      "sandbox": true,
      "defaultContainer": "claude-sandbox:latest",
      "workspaceMount": "/workspace",
      "resourceLimits": {
        "memory": "8g",
        "cpus": "4"
      },
      "security": {
        "noNewPrivileges": true,
        "dropCapabilities": ["ALL"],
        "addCapabilities": ["DAC_OVERRIDE"]
      }
    }
  '';

  # Add Claude Code aliases
  programs.zsh.shellAliases = {
    claude = "~/code/dotfiles/scripts/claude-sandbox.sh";
    cc = "~/code/dotfiles/scripts/claude-sandbox.sh";
  };
}