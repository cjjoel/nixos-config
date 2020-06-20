{ config, options, lib, ... }:

with lib; with types; {
  options.modules.window-manager = {
      i3wm.enable = mkOption { type = bool; default = false; };
    };

  config.my.home.xsession.windowManager = {
    i3 = mkIf config.modules.window-manager.i3wm.enable
      (import ../configs/i3wm.nix { inherit lib; });
  };
}
