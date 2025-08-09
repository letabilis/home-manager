{ config, pkgs, ... }:

{
  home = {
    username = "sahil";
    homeDirectory = "/home/sahil";
    stateVersion = "25.05";
    packages = with pkgs; [
      vim
      
      wget
      zsh
      zsh-syntax-highlighting


      git
      direnv
      nix-direnv
    ];
   sessionVariables = {
    EDITOR = "vim";
    SHELL = "${config.home.homeDirectory}/.nix-profile/bin/zsh";
    PATH = "$PATH:${config.home.homeDirectory}/.nix-profile/bin";
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:${config.home.homeDirectory}/.nix-profile/bin:${config.home.homeDirectory}/.nix-profile/share";
   };

   
  };
 programs = { 
   home-manager.enable = true;
   bash.enable = true;  
 };
}
