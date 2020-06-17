{ config, options, lib, ... }:

with lib; {
  options.modules.desktop.display-manager.startx = {
    enable = mkOption { type = types.bool; default = false; };
  };

  config = mkIf config.modules.desktop.display-manager.startx.enable {
    services.xserver.displayManager.startx.enable = true;
  };
}
