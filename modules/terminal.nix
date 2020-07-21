{ config, options, lib, ... }:

with lib; with types;
let
  pkg-terminal-enable = (import ./pkg.nix { inherit lib config; } "terminal" (import ./enable.nix));
  termite-conf = import ../nix-home/termite.nix;
in {

  options.modules.terminal = {
    termite.enable = mkOption { type = bool; default = false; };
  };

  config = mkMerge [ 
    (pkg-terminal-enable { package = "termite"; conf = termite-conf; })
  ];
}
