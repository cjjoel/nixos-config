{ config, options, lib, pkgs, ... }:
with lib;
{
  options.modules.terminal.termite = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.terminal.termite.enable {
    my.home.programs = import ../../configs/termite.nix;
  };
}
