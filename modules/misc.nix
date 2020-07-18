{ pkgs, config, options, lib, ... }:

with lib; with types; {
  options.modules.misc = {
    cowsay.enable = mkOption { type = bool; default = false; };
    fortune.enable = mkOption { type = bool; default = false; };
    neofetch.enable = mkOption { type = bool; default = false; };
  };

#  config.my.packages = with pkgs; [
#    (mkIf config.modules.misc.cowsay.enable cowsay) 
#    (mkIf config.modules.misc.fortune.enable fortune) 
#    (mkIf config.modules.misc.neofetch.enable neofetch) 
#  ];


  config = (mkIf config.modules.misc.neofetch.enable 
    (import ./install.nix { package = pkgs.neofetch; inherit pkgs; inherit lib; inherit config;}));
}
