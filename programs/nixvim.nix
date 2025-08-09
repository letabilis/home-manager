let
    nixvim = import (builtins.fetchGit {
        url = "https://github.com/nix-community/nixvim";
	ref = "nixos-25.05";
	rev = "ab1b5962e1ca90b42de47e1172e0d24ca80e6256";
    });
in
{
   imports = [ 
     nixvim.homeModules.nixvim
   ];

   programs.nixvim = { 
     enable = true;  
   };
}
