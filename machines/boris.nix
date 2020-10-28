{ pkgs, lib, ... }:

{
  imports = [ 
    ../hardware-configurations/boris.nix
    ./common.nix ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
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

  networking.hostName = "boris";
  networking.networkmanager.enable = true; 
  
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.opengl.driSupport32Bit = true;

  nixpkgs.config.allowUnfree = true;
  
  time.timeZone = "Asia/Kolkata";
  time.hardwareClockInLocalTime = true;
  
  services.xserver = { 
    enable = true;
    libinput.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

# battery-notification service is based on domenkozar's suspend.nix
# https://gist.github.com/domenkozar/82886ee82efee623cdc0d19eb81c7fb7

#  systemd.user.timers."battery-notification" = {
#    description = "check battery level";
#    timerConfig.OnBootSec = "1m";
#    timerConfig.OnUnitInactiveSec = "1m";
#    timerConfig.Unit = "battery-notification.service";
#    wantedBy = ["timers.target"];
#  };
#
#  systemd.user.services."battery-notification" = {
#    description = "battery level notification service";
#    serviceConfig.PassEnvironment = "DISPLAY";
#    script = '' 
#      export battery_capacity=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/BAT1/capacity)
#      export battery_status=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/BAT1/status)
#      export warning_level=20
#      export hibernate_level=10
#
#      if [[ $battery_capacity -le $warning_level && $battery_status = "Discharging" ]]; then
#          ${pkgs.libnotify}/bin/notify-send --urgency=critical --hint=int:transient:1 --icon=battery_empty "LOW BATTERY"
#      fi
#
#      if [[ $battery_capacity -le $hibernate_level && $battery_status = "Discharging" ]]; then
#          ${pkgs.libnotify}/bin/notify-send --urgency=critical --hint=int:transient:1 --icon=battery_empty "Battery level critical\nComputer will hibernate in 60 seconds."
#          sleep 60s
#          battery_status=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/BAT1/status)
#          if [[ $battery_status = "Discharging" ]]; then
#              systemctl hibernate
#          fi
#      fi
#      '';
#  };
#

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
  
}
