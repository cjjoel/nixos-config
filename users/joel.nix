{ pkgs, ... }:

{
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
  ];

  users.users.joel = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
  };

}
