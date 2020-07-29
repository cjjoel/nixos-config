{ pkgs, ... }:

{
  imports = [ 
    ../hardware-configurations/origen.nix
    ./common.nix ];

  boot.loader.timeout = 2;
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
    extraEntriesBeforeNixOS = true;
    extraEntries = ''
      menuentry "Windows 7" {
        chainloader (hd0,1)+1
      }
    '';
  };

  networking.hostName = "origen";
  environment.systemPackages = with pkgs; [ exfat ntfs3g ];
  programs.light.enable = true;
  
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  my.packages = with pkgs; [ pavucontrol ];

  networking.networkmanager.enable = true; 
  my.home.services.network-manager-applet.enable = true;

  hardware.opengl.driSupport32Bit = true;
  nixpkgs.config.allowUnfree = true;
  #virtualisation.libvirtd.enable = true;

  time.timeZone = "Asia/Kolkata";
  time.hardwareClockInLocalTime = true;
}
