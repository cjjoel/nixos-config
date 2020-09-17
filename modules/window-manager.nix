{ config, options, lib, pkgs, ... }:

with lib; with types;
let
  pkg-wm-install = (import ./pkg.nix { inherit lib config; } "window-manager" (import ./install.nix));
  pkg-wm-enable = (import ./pkg.nix { inherit lib config; } "window-manager" (import ./enable.nix));
  i3status-conf = import ../nix-home/i3status.nix;
in {
  options.modules.window-manager = {
    i3wm.enable = mkOption { type = bool; default = false; };
  };

  config = 
    mkMerge [ 
      (pkg-wm-install { package = pkgs.libnotify; mod = "i3wm"; })

      { my.home = {
        services = {
          dunst = mkIf config.modules.window-manager.i3wm.enable (import ../nix-home/dunst.nix);
        };

        home.file = mkIf config.modules.window-manager.i3wm.enable {
          ".xinitrc".text = ''
            exec i3
          ''; };

        xsession.windowManager = {
          i3 =  mkIf config.modules.window-manager.i3wm.enable
            (import ../nix-home/i3wm.nix { inherit lib; inherit pkgs; });
        };
      }; }
    ];
}
