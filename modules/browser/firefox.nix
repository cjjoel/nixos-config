{ config, options, lib, pkgs, ... }:
with lib;
{ 
  options.modules.browser.firefox = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.browser.firefox.enable {
    my = {
      # packages = with pkgs; [ firefox ];
      home.programs.firefox.enable = true;
    };
  };
}
