{ config, options, lib, pkgs, ... }:
with lib;

{ 
  options.modules.utils.zathura = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.utils.zathura.enable {
    my.packages = with pkgs; [ zathura ];
    };
}
