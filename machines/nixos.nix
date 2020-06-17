{ pkgs, ... }:

{
  imports = [ 
    ../hardware-configurations/HP-laptop.nix
    ./common.nix ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
    extraEntries = ''
      menuentry "Windows 10" {
        chainloader (hd0,1)+1
      }
    '';
  };

  networking.hostName = "nixos";
  environment.systemPackages = with pkgs; [ exfat ntfs3g ];
  programs.light.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.opengl.driSupport32Bit = true;
  nixpkgs.config.allowUnfree = true;
}
