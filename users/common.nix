{
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Kolkata";
  console.keyMap = "us";
  console.font = "Lat2-Terminus18";

  fonts = {
    fontconfig.enable = true;
	  enableFontDir = true;
	  enableGhostscriptFonts = true;
	};

  security.sudo.wheelNeedsPassword = false;
  networking.networkmanager.enable = true; 
  my.home.programs.home-manager.enable = true;
}
