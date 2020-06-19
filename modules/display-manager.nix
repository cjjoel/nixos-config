{ config, options, lib, ... }:

with lib; {
  options.modules.display-manager = {
      startx.enable = mkOption { type = types.bool; default = false; };
    };

  config.services.xserver.displayManager = {
    startx.enable = mkIf config.modules.display-manager.startx.enable true;
  };
}
