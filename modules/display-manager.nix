{ config, options, lib, ... }:

with lib; with types; {
  options.modules.display-manager = {
      startx.enable = mkOption { type = bool; default = false; };
    };

  config.services.xserver.displayManager = {
    startx.enable = mkIf config.modules.display-manager.startx.enable true;
  };
}
