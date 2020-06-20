{ pkgs, ... }:

{
  imports = [ ./common.nix ../modules ];

  modules = {
    shell.bash.enable = true;
    terminal.termite.enable = true;
    
    window-manager.i3wm.enable = true;
    display-manager.startx.enable = true;
    
    utils = {
      tree.enable = true;
      feh.enable = true;
      git.enable = true;
      mpv.enable = true;
      zathura.enable = true;
    };

    editor = {
      neovim.enable = true;
      emacs.enable = true;
    };

    browser = {
      firefox.enable = true;
      chromium.enable = true;
    };
    
    social = {
      discord.enable = true;
      riot.enable = true;
    };

    misc = {
      cowsay.enable = true;
      fortune.enable = true;
      neofetch.enable = true;
    };
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
