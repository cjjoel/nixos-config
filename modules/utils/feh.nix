{ config, options, lib, pkgs, ... }:
with lib;

{ 
  options.modules.utils.feh = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.utils.feh.enable {
    my.packages = with pkgs; [ feh ];
    };
}
