{ config, options, lib, pkgs, ... }:
with lib;
{ 
  options.modules.browser.chromium = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.browser.chromium.enable {
    my = {
      home.programs = import ../../configs/chromium.nix;
    };
  };
}
