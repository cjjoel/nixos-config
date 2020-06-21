{ pkgs, config, options, lib, ... }:

with lib; with types; {
  options.modules.utils = {
      git.enable = mkOption { type = bool; default = false; };
      feh.enable = mkOption { type = bool; default = false; };
      tree.enable = mkOption { type = bool; default = false; };
      zathura.enable = mkOption { type = bool; default = false; };
      mpv.enable = mkOption { type = bool; default = false; };
      youtube-dl.enable = mkOption { type = bool; default = false; };
      fd.enable = mkOption { type = bool; default = false; };
      thefuck.enable = mkOption { type = bool; default = false; };
    };

  config = {
    my.packages = with pkgs; [
      (mkIf config.modules.utils.feh.enable feh) 
      (mkIf config.modules.utils.tree.enable tree) 
      (mkIf config.modules.utils.mpv.enable mpv) 
      (mkIf config.modules.utils.youtube-dl.enable youtube-dl) 
      (mkIf config.modules.utils.fd.enable fd) 
      (mkIf config.modules.utils.thefuck.enable fd) 
    ];

    my.home.programs = {
      git = (mkIf config.modules.utils.git.enable (import ../configs/git.nix));
      zathura = (mkIf config.modules.utils.zathura.enable (import ../configs/zathura.nix));
    };
  };

}
