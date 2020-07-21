{ config, options, lib, ... }:

with lib; with types; {

  options.modules.window-manager = {
    i3wm.enable = mkOption { type = bool; default = false; };
  };

  config.my.home = {

    home.file = mkIf config.modules.window-manager.i3wm.enable {
      ".xinitrc".text = "exec i3"; };

    xsession.windowManager = {
    i3 = mkIf config.modules.window-manager.i3wm.enable
      (import ../nix-home/i3wm.nix { inherit lib; });
    };
  };
}
