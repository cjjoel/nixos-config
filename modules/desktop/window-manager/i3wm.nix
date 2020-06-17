{ pkgs, config, options, lib, ... }:

with lib;
{
  # imports = [ ../../../configs/i3wm.nix ];

  options.modules.desktop.window-manager.i3wm = {
    enable = mkOption { type = types.bool; default = false; };
  };

  config = mkIf config.modules.desktop.window-manager.i3wm.enable {
	  # imports = [ ../../../configs/i3wm.nix ];
	  my.home = import ../../../configs/i3wm.nix;
  };
}
