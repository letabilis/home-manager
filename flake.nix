{
  description = "Sahil's Home Manager Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  
    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."sahil-home" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./programs/git.nix
          ./programs/zsh.nix
        ];
      };
    };
}

