{ pkgs, config, options, lib, ... }:

with lib; with types; 
let 
  pkg-editor-enable = (import ./pkg.nix { inherit lib config; } "editor" (import ./enable.nix));
  pkg-editor-install = (import ./pkg.nix { inherit lib config; } "editor" (import ./install.nix));
  neovim-conf = import ../nix-home/neovim.nix;

  org-capture = with pkgs; (makeDesktopItem {
    name = "org-capture";
    desktopName = "org-capture";
    mimeType = "x-scheme-handler/org-protocol";
    exec = "emacsclient %u";
    icon = "emacs";
    type = "Application";
  });
in {

  options.modules.editor = {
      neovim.enable = mkOption { type = bool; default = false; };
      doom.enable = mkOption { type = bool; default = false; };
    };

  config = 
    mkMerge [
      (pkg-editor-enable { package = "neovim"; conf = neovim-conf; })

      (pkg-editor-enable { package = "emacs"; mod = "doom"; })
      (pkg-editor-install { package = org-capture; mod = "doom"; })
      (pkg-editor-install { package = pkgs.sqlite; mod = "doom"; })

      { my.home.home.file = mkIf config.modules.editor.doom.enable { ".doom.d".source = ../nix-home/bin/doom.d; }; }
  ];
}
