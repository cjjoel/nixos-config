{ config, options, lib, ... }:

with lib; with types; {
  options.modules.<category> = {
    <program>.enable = mkOption { type = types.bool; default = false; };
  };

  config = {
    my.packages = with pkgs; [
      (mkIf config.modules.<category>.<program>.enable <package>) 
    ];

    my.home.programs = {
      <program>.enable = (mkIf config.modules.<categroy>.<program>.enable true);
      <program> = (mkIf config.modules.<category>.<program>.enable (import ../configs/<program>.nix));
    };
  };

}
