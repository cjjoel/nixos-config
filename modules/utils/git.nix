{ config, options, lib, pkgs, ... }:
with lib;
{ 
  options.modules.utils.git = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.utils.git.enable {
    my.home.programs = import ../../configs/git.nix;
    };
}
