{ config, pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" ];
    };
    dirHashes = {
      hmngr = "${config.home.homeDirectory}/.config/home-manager"; 
    };
    oh-my-zsh = {
      enable = true;
      theme = "zhann";
    };
  };
}
