{ config, pkgs, options, lib, ... }:

with lib; {
  options.modules.misc.neofetch = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.misc.neofetch.enable {
	  my.packages = with pkgs; [ neofetch ];
  };
}
