{ config
, pkgs
, ...
}:
let
  nixGLMesa =
    (pkgs.callPackage
      "${builtins.fetchTarball {
        url = "https://github.com/nix-community/nixgl/archive/a8e1ce7d49a149ed70df676785b07f63288f53c5.tar.gz";
        sha256 = "010n26nhha1l64m7m08rzrfhyixfr8japn3vzbn80dj092wwggrr";
      }}/nixGL.nix"
      { }).nixGLMesa;
in
{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.fantasque-sans-mono;
      name = "Fantasque Sans Mono";
      size = 8;
    };

    themeFile = "Catppuccin-Macchiato";

    shellIntegration.enableZshIntegration = true;

    package = pkgs.writeShellScriptBin "kitty" ''
      #!/bin/sh
      exec ${nixGLMesa}/bin/nixGLMesa ${pkgs.kitty}/bin/kitty "$@"
    '';
  };
}
