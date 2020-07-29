{ pkgs, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";
  console.font = "Lat2-Terminus18";

  fonts = {
    fontconfig.enable = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
  };

  security.sudo.wheelNeedsPassword = false;
  my.home.programs.home-manager.enable = true;
}
