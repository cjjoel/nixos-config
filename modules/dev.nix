{ pkgs, config, options, lib, ... }:

with lib; with types; {
  options.modules.dev = {
    racket.enable = mkOption { type = types.bool; default = false; };
  };

  config.my.packages = with pkgs; [
    (mkIf config.modules.dev.racket.enable racket) 
  ];
}
