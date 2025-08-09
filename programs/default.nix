let
  git = import ./git.nix;
  zsh = import ./zsh.nix;
in
{
  inherit git zsh;
}
