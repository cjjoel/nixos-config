{ pkgs, config, options, lib, ... }:

with lib; with types; 
let 
  pkg-editor-enable = (import ./pkg.nix { inherit lib config; } "editor" (import ./enable.nix));
  install = import ./install.nix;
  enable = import ./enable.nix;
  neovim-conf = import ../configs/neovim.nix;
  emacs-conf = import ../configs/emacs.nix;

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

  config = mkMerge [ 
    (pkg-editor-enable { package = "neovim"; conf = neovim-conf; })

    (enable { package = "emacs"; conf = emacs-conf; cond = config.modules.editor.doom.enable; inherit lib; })
    (install { package = org-capture; cond = config.modules.editor.doom.enable; inherit lib; })
    (install { package = pkgs.sqlite; cond = config.modules.editor.doom.enable; inherit lib; })
  ];
}
