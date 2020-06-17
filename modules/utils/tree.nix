{ config, options, lib, pkgs, ... }:
with lib;

{ 
  options.modules.utils.tree = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.utils.tree.enable {
    my.packages = with pkgs; [ tree ];
    };
}
