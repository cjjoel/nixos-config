{ pkgs, ... }:

{
  imports = [ 
    ./common.nix 
    ../modules
    ../services/xserver.nix 
  ];

  modules = {
    shell.bash.enable = true;
    terminal.termite.enable = true;

    window-manager.i3wm.enable = true;
    display-manager.startx.enable = true;
    
    editor.neovim.enable = true;

    #browser.firefox.enable = true;

    utils.fd.enable = true;
    utils.git.enable = true;
  };

  my.username = "min";
	my.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
  };

  fonts.fonts = with pkgs; [ ubuntu_font_family source-code-pro ];

  # networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
