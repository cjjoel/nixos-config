{ config, options, lib, pkgs, ... }:
with lib;
{ 
  #imports  = [ ../../configs/bash.nix ];

  options.modules.shell.bash = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.shell.bash.enable {
    my.home.programs = import ../../configs/bash.nix;
    };
}
