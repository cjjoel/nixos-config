{ config, pkgs, options, lib, ... }:

with lib; {
  options.modules.social.discord = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.social.discord.enable {
	  my.packages = with pkgs; [ discord ];
  };
}
