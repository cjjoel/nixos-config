{ pkgs, config, options, lib, ... }:

with lib; with types; {
  options.modules.misc = {
    cowsay.enable = mkOption { type = bool; default = false; };
    fortune.enable = mkOption { type = bool; default = false; };
    neofetch.enable = mkOption { type = bool; default = false; };
  };

  config = mkMerge [
    (mkIf config.modules.misc.cowsay.enable 
      (import ./install.nix { package = pkgs.cowsay; enable = false; inherit lib;}))

    (mkIf config.modules.misc.fortune.enable 
      (import ./install.nix { package = pkgs.fortune; enable = false; inherit lib;}))

    (mkIf config.modules.misc.neofetch.enable 
      (import ./install.nix { package = pkgs.neofetch; enable = false; inherit lib;}))
  ];

}
