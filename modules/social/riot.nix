{ config, pkgs, options, lib, ... }:

with lib; {
  options.modules.social.riot = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.social.riot.enable {
	  my.packages = with pkgs; [ riot-desktop ];
  };
}
