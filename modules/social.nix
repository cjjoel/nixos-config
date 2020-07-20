{ pkgs, config, options, lib, ... }:

with lib; with types;
let
  install = import ./install.nix;
  pkg-social-install = (import ./pkg.nix { inherit lib config; } "social" (import ./install.nix));
in {

  options.modules.social = {
    discord.enable = mkOption { type = types.bool; default = false; };
    riot.enable = mkOption { type = types.bool; default = false; };
  };

  config = mkMerge [ 
    (pkg-social-install { package = pkgs.discord; })
    (install { package = pkgs.riot-desktop; cond = config.modules.social.riot.enable; inherit lib; })
  ];
}
