{ pkgs, config, options, lib, ... }:

with lib; with types; 
let
  pkg-misc-install = (import ./pkg.nix { inherit lib config; } "misc" (import ./install.nix));
in {

  options.modules.misc = {
    cowsay.enable = mkOption { type = bool; default = false; };
    fortune.enable = mkOption { type = bool; default = false; };
    neofetch.enable = mkOption { type = bool; default = false; };
    hello-unfree.enable = mkOption { type = bool; default = false; };
    hello.enable = mkOption { type = bool; default = false; };
  };

  config = mkMerge (map (x: pkg-misc-install { package = x; }) (with pkgs; [
    cowsay
    neofetch
    fortune
    hello
    hello-unfree
  ]));
}
