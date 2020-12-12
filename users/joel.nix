{ pkgs, ... }:


let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; }; in {
  imports = [ 
    ./common.nix
  ];

  environment.systemPackages = with pkgs; [ 
  # Devolopment 
      neovim
      git
      sbcl
      rlwrap
      gcc
      python3
      python38Packages.pynvim
      python38Packages.jedi
      nodejs
      yarn
      clang
      clang-tools
      cpplint
      gnumake
      emacs
  
  # Social
      discord
      element-desktop
      tdesktop
      zoom-us
  
  # Other
      pavucontrol
      firefox
      neofetch
      chromium
      obsidian
      tree
      fd
      stow
      mpv
      vlc
      youtube-dl
      sqlite
      neuron-notes
      zettlr
      pandoc
      haskellPackages.pandoc-citeproc
      texlive.combined.scheme-basic
      tectonic
      zotero
      xdotool
      xautomation
    ];

  users.users.joel = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
  };

}
