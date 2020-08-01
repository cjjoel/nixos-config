{ appimageTools, fetchurl, gsettings-desktop-schemas, gtk3 }:

appimageTools.wrapType2 {
  name = "obsidian";
  profile = ''
    export LC_ALL=C.UTF-8
    export XDG_DATA_DIRS=${gsettings-desktop-schemas}/share/gsettings-schemas/${gsettings-desktop-schemas.name}:${gtk3}/share/gsettings-schemas/${gtk3.name}:$XDG_DATA_DIRS
  '';
  src = fetchurl {
    url = "https://github.com/obsidianmd/obsidian-releases/releases/download/v0.8.0/Obsidian-0.8.0.AppImage";
    sha256 = "0y3ld7b1wbn0plhz6pvhy2mb6g54dqzbcy7da4qcs3d6rx8f2520";
  };
  extraPkgs = pkgs: with pkgs; [ hicolor-icon-theme wrapGAppsHook ];
}
