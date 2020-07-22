{ pkgs, config, options, lib, ... }:

with lib; with types; 
let
  pkg-utils-install = (import ./pkg.nix { inherit lib config; } "utils" (import ./install.nix));
  pkg-utils-enable = (import ./pkg.nix { inherit lib config; } "utils" (import ./enable.nix));
  git-conf = import ../nix-home/git.nix;
  zathura-conf = import ../nix-home/zathura.nix;
in {
  options.modules.utils = {
    git.enable = mkOption { type = bool; default = false; };
    feh.enable = mkOption { type = bool; default = false; };
    tree.enable = mkOption { type = bool; default = false; };
    zathura.enable = mkOption { type = bool; default = false; };
    mpv.enable = mkOption { type = bool; default = false; };
    youtube-dl.enable = mkOption { type = bool; default = false; };
    fd.enable = mkOption { type = bool; default = false; };
    htop.enable = mkOption { type = bool; default = false; };
    thefuck.enable = mkOption { type = bool; default = false; };
  };

  config = mkMerge ((map (x: pkg-utils-install { package = x; }) (with pkgs; [
    feh
    tree
    mpv
    youtube-dl
    fd
    thefuck
    htop
  ])) ++ [
  (pkg-utils-enable { package = "git"; conf = git-conf; })
  (pkg-utils-enable { package = "zathura"; conf = zathura-conf; })
  ]);
}
