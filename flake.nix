{
  description = "Ricardo's M1 Max MacBook Configuration";

  inputs = {
    # Package sources
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # macOS system management
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # User environment management
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Neovim distributions
    lazyvim = {
      url = "github:LazyVim/LazyVim";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, darwin, home-manager, ... }@inputs: {
    darwinConfigurations = {
      "ricardos-mbp" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [
          ./darwin/configuration.nix
          ./darwin/homebrew.nix
          
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."ricardo-work" = import ./home-manager/profiles/work.nix;
              users."ricardo-personal" = import ./home-manager/profiles/personal.nix;
            };
          }
        ];
      };
    };
    
    # Development shells for projects
    devShells.aarch64-darwin = {
      default = nixpkgs.legacyPackages.aarch64-darwin.mkShell {
        packages = with nixpkgs.legacyPackages.aarch64-darwin; [
          nodejs_20
          python3
          docker
          git
        ];
      };
    };
  };
}