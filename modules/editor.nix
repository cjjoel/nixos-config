{ pkgs, config, options, lib, ... }:

with lib; with types; {
  options.modules.editor = {
      neovim.enable = mkOption { type = bool; default = false; };
      emacs.enable = mkOption { type = bool; default = false; };
    };

  config.my = {
    packages = with pkgs; [
      (makeDesktopItem {
        name = "org-capture";
        desktopName = "org-capture";
        mimeType = "x-scheme-handler/org-protocol";
        exec = "emacsclient %u";
        icon = "emacs";
        type = "Application";
      })];
    home.programs = {
      neovim = (mkIf config.modules.editor.neovim.enable (import ../configs/neovim.nix));
      emacs = (mkIf config.modules.editor.emacs.enable (import ../configs/emacs.nix));
    };
  };
}
