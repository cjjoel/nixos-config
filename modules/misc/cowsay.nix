{ config, pkgs, options, lib, ... }:

with lib; {
  options.modules.misc.cowsay = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.misc.cowsay.enable {
	  my.packages = with pkgs; [ cowsay ];
  };
}
