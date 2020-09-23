{ pkgs, ... }:

{
  imports = [ 
    ./common.nix 
    ../modules
  ];

  modules = {
    #pkgList = [ pkgs.direnv ];
    #enableList = [ "direnv" ];

    shell.bash.enable = true;
    terminal.termite.enable = true;

    window-manager.i3wm.enable = true;
    display-manager.startx.enable = true;
    
    dev = {
      # racket.enable = true;
      # heroku.enable = true;
      gcc.enable = true; 
      # clang.enable = true;
      rlwrap.enable = true;
      sbcl.enable = true;
      jdk7.enable = true;
    };

    editor = {
      neovim.enable = true;
      doom.enable = true;
      emacs.enable = true;
    };

    browser = {
      firefox.enable = true;
      chromium.enable = true;
    };
    
    social = {
      discord.enable = true;
      riot.enable = true;
      telegram.enable = true;
      zoom.enable = true;
    };

    misc = {
      # cowsay.enable = true;
      # fortune.enable = true;
      # neofetch.enable = true;
      # hello-unfree.enable = true;
      # hello.enable = true;
    };

    reading = {
      zathura.enable = true;
      calibre.enable = true;
      # adobe-reader.enable = true;
    };

    utils = {
      tree.enable = true;
      # feh.enable = true;
      git.enable = true;
      mpv.enable = true;
      # youtube-dl.enable = true;
      fd.enable = true;
      # thefuck.enable = true;
      htop.enable = true;
      obsidian.enable = true;
    };
  };

  my.home.home.file = {
    ".i3status.conf".source = ../nix-home/bin/i3status.conf;
  };

  my.username = "joel";
	my.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
  };

  fonts.fonts = with pkgs; [ ubuntu_font_family source-code-pro ];

  # networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
