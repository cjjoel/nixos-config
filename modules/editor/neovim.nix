{ config, options, lib, pkgs, ... }:
with lib;
{ 
  # imports  = [ ../../configs/neovim.nix ];

  options.modules.editor.neovim = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.editor.neovim.enable {
    # my.packages = with pkgs; [ neovim ];
    my.home.programs = import ../../configs/neovim.nix;
    };
}
