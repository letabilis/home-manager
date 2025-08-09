{ config, pkgs, ... }: {
  programs = {
    git = {
      enable = true;

      userName = "letabilis";
      userEmail = "192747580+letabilis@users.noreply.github.com";

      signing = {
        signByDefault = true;
        format = "ssh";
        key = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };

      aliases = { 
        st = "status";
        sw = "switch";
        cm = "commit -m";
        lo = "log --oneline";
        cp = "cherry-pick";
      };

      extraConfig = {
        init.defaultBranch = "main";
        url."git@github.com:".insteadOf = "https://github.com/";
        core.editor = "vim";
      };
    };

    gitui = {
      enable = true;
      theme = "${config.home.homeDirectory}/.config/home-manager/preferences/gitui-themes/catpuccin-machiato.ron";  
    };
  };
}

