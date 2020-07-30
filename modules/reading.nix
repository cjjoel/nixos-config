{ pkgs, config, options, lib, ... }:

with lib; with types; 
let
  pkg-reading-install = (import ./pkg.nix { inherit lib config; } "reading" (import ./install.nix));
  pkg-reading-enable = (import ./pkg.nix { inherit lib config; } "reading" (import ./enable.nix));
in {

  options.modules.reading = {
    calibre.enable = mkOption { type = bool; default = false; };
    zathura.enable = mkOption { type = bool; default = false; };
    adobe-reader.enable = mkOption { type = bool; default = false; };
  };

  config = mkMerge [
      (pkg-reading-install { package = pkgs.calibre; })
      (pkg-reading-enable { package = pkgs.zathura; })
      (pkg-reading-install { package = pkgs.adobe-reader; })
  ];
}
