{ config, options, lib, ... }:

with lib; {
  options.modules.window-manager = {
      i3wm.enable = mkOption { type = types.bool; default = false; };
    };

  config.my.home.xsession.windowManager = {
    i3 = mkIf config.modules.window-manager.i3wm.enable
      (import ../configs/i3wm.nix { lib = lib; });
  };
}
