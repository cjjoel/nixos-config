{ config, options, lib, ... }:

with lib; with types;
let 
  pkg-shell-enable = (import ./pkg.nix { inherit lib config; } "shell" (import ./enable.nix));
  bash-conf = import ../nix-home/bash.nix;
in {

  options.modules.shell = {
    bash.enable = mkOption { type = bool; default = false; };
    };

  config = mkMerge [
    (pkg-shell-enable { package = "bash"; conf = bash-conf; })
  ];
}
