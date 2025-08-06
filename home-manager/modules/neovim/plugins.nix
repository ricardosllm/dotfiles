{ config, pkgs, ... }:

{
  # Additional Neovim plugins configuration
  # This file can be imported by default.nix if needed for custom plugins
  
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Essential plugins (most will be handled by LazyVim)
    nvim-treesitter
    telescope-nvim
    nvim-lspconfig
    nvim-cmp
    
    # Git integration
    gitsigns-nvim
    vim-fugitive
    
    # UI enhancements
    lualine-nvim
    nvim-tree-lua
    
    # Additional language support
    vim-nix
    vim-markdown
    vim-json
  ];
}