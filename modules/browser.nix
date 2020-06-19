{ config, options, lib, ... }:

with lib; with types; {
  options.modules.browser = {
      firefox.enable = mkOption { type = bool; default = false; };
      chromium.enable = mkOption { type = bool; default = false; };
    };

  config.my.home.programs = {
    firefox.enable = (mkIf config.modules.browser.firefox.enable true);
    chromium = (mkIf config.modules.browser.chromium.enable (import ../configs/chromium.nix));
  };
}
