{ pkgs, config, options, lib, ... }:

with lib; with types; 
let 
  pkg-browser-enable = (import ./pkg.nix { inherit lib config; } "browser" (import ./enable.nix));
  chromium-conf = import ../nix-home/chromium.nix;
in {

  options.modules.browser = {
      firefox.enable = mkOption { type = bool; default = false; };
      chromium.enable = mkOption { type = bool; default = false; };
    };

  config = mkMerge [ 
    (pkg-browser-enable { package = "firefox"; })
    (pkg-browser-enable { package = "chromium"; conf = chromium-conf; })
  ];
}
