{ pkgs, config, options, lib, ... }:

with lib; with types; {
  options.modules.social = {
    discord.enable = mkOption { type = types.bool; default = false; };
    riot.enable = mkOption { type = types.bool; default = false; };
  };

  config.my.packages = with pkgs; [
    (mkIf config.modules.social.discord.enable discord) 
    (mkIf config.modules.social.riot.enable riot-desktop) 
  ];
}
