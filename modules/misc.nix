{ pkgs, config, options, lib, ... }:

with lib; with types; 
let
  pkg-misc-install = (import ./pkg.nix { inherit lib config; } "misc" (import ./install.nix));
in {

  options.modules.misc = {
    cowsay.enable = mkOption { type = bool; default = false; };
    fortune.enable = mkOption { type = bool; default = false; };
    neofetch.enable = mkOption { type = bool; default = false; };
  };

  config = mkMerge (map pkg-misc-install [ 
    { package = pkgs.cowsay; } 
    { package = pkgs.neofetch; } 
    { package = pkgs.fortune; } 
  ]);
}
