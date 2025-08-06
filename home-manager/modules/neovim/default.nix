{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    
    # Use LazyVim distribution
    extraConfig = ''
      lua << EOF
        -- Bootstrap lazy.nvim
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not vim.loop.fs_stat(lazypath) then
          vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
          })
        end
        vim.opt.rtp:prepend(lazypath)
        
        -- Load LazyVim
        require("lazy").setup({
          spec = {
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },
            { import = "plugins" },
          },
        })
      EOF
    '';
    
    # Additional packages
    extraPackages = with pkgs; [
      # Language servers
      lua-language-server
      nodePackages.typescript-language-server
      nodePackages.pyright
      rust-analyzer
      
      # Formatters
      nixpkgs-fmt
      black
      prettier
      rustfmt
      
      # Tools
      ripgrep
      fd
      tree-sitter
    ];
  };
}