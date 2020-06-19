{ config, options, lib, ... }:

with lib; with types; {
  options.modules.shell = {
      bash.enable = mkOption { type = bool; default = false; };
    };

  config.my.home.programs = {
    bash = (mkIf config.modules.shell.bash.enable (import ../configs/bash.nix));
  };
}
