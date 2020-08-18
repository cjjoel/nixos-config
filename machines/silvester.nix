{ pkgs, lib, ... }:

{
  imports = [ 
    ../hardware-configurations/HP-laptop.nix
    ./common.nix ];

  boot.extraModulePackages = [ 
    (import ../rtlwifi_ext.nix)
  ];

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

  networking.hostName = "silvester";
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

#  services.upower.enable = true;
#  services.upower.criticalPowerAction = "Hibernate";
#  services.upower.percentageLow = 20;
#  services.upower.percentageCritical = 10;
#  services.upower.percentageAction = 9;

  systemd.user.timers."battery-notification" = {
    description = "check battery level";
    timerConfig.OnBootSec = "1m";
    timerConfig.OnUnitInactiveSec = "1m";
    timerConfig.Unit = "battery-notification.service";
    wantedBy = ["timers.target"];
  };

  systemd.user.services."battery-notification" = {
    description = "battery level notification service";
    serviceConfig.PassEnvironment = "DISPLAY";
    script = '' 
      export battery_capacity=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/BAT1/capacity)
      export battery_status=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/BAT1/status)
      export warning_level=20
      export hibernate_level=10

      if [[ $battery_capacity -le $warning_level && $battery_status = "Discharging" ]]; then
          ${pkgs.libnotify}/bin/notify-send --urgency=critical --hint=int:transient:1 --icon=battery_empty "LOW BATTERY"
      fi

      if [[ $battery_capacity -le $hibernate_level && $battery_status = "Discharging" ]]; then
          ${pkgs.libnotify}/bin/notify-send --urgency=critical --hint=int:transient:1 --icon=battery_empty "Battery level critical\nComputer will hibernate in 60 seconds."
          sleep 60s
          battery_status=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/BAT1/status)
          if [[ $battery_status = "Discharging" ]]; then
              systemctl hibernate
          fi
      fi
      '';
  };

  services.xserver = { 
    enable = true;
    libinput.enable = true;
	  #libinput.naturalScrolling = true; #reverse scrolling
    #autoRepeatDelay = 250;
  };

#  services.udev.extraRules = ''
#    SUBSYSTEM=="power_supply",
#    KERNEL=="BAT1",
#    ATTR{status}=="Discharging",
#    ATTR{capacity}=="[0-20]",
#    RUN+="${pkgs.coreutils}/bin/coreutils --coreutils-prog=notify-send -u critical LOW BATTERY"
#  '';
#    #RUN+="${pkgs.systemd}/bin/systemctl poweroff"
}
