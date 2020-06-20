{ config, options, lib, ... }:

with lib; with types; {
  options.modules.terminal = {
      termite.enable = mkOption { type = bool; default = false; };
    };

  config.my.home.programs = {
    termite = (mkIf config.modules.terminal.termite.enable (import ../configs/termite.nix));
  };
}
