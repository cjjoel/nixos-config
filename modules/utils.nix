{ pkgs, config, options, lib, ... }:

with lib; with types; {
  options.modules.utils = {
      git.enable = mkOption { type = bool; default = false; };
      feh.enable = mkOption { type = bool; default = false; };
      tree.enable = mkOption { type = bool; default = false; };
      zathura.enable = mkOption { type = bool; default = false; };
      mpv.enable = mkOption { type = bool; default = false; };
      youtube-dl.enable = mkOption { type = bool; default = false; };
    };

  config = {
    my.packages = with pkgs; [
      (mkIf config.modules.utils.feh.enable feh) 
      (mkIf config.modules.utils.tree.enable tree) 
      (mkIf config.modules.utils.zathura.enable zathura) 
      (mkIf config.modules.utils.mpv.enable mpv) 
      (mkIf config.modules.utils.mpv.enable youtube-dl) 
    ];

    my.home.programs = {
      git = (mkIf config.modules.utils.git.enable (import ../configs/git.nix));
    };
  };

}
