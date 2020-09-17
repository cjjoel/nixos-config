{ lib, pkgs }:

let 
mod="Mod4";
ws1 = "1:Term";
ws2 = "2:Browser";
ws3 = "3:Emacs";
ws4 = "4:Matrix";
ws5 = "5:Class"; in {
  enable = true;
  config = {
    startup = [
      { command = "systemctl --user import-environment"; }
      { command = "systemctl start --user dunst.service"; }
      { command = "systemctl start --user network-manager-applet.service"; }
    ];
    
    modifier = "Mod4";
    terminal = "termite";
    fonts=["Ubuntu Mono 14"];
    bars = [{ 
      fonts = ["Ubuntu Mono 14"];
    }];
    keybindings = lib.mkOptionDefault {
      "${mod}+1" = "workspace ${ws1}";
      "${mod}+2" = "workspace ${ws2}";
      "${mod}+3" = "workspace ${ws3}";
      "${mod}+4" = "workspace ${ws4}";
      "${mod}+5" = "workspace ${ws5}";

      "${mod}+Shift+1" = "move container to workspace ${ws1}";
      "${mod}+Shift+2" = "move container to workspace ${ws2}";
      "${mod}+Shift+3" = "move container to workspace ${ws3}";
      "${mod}+Shift+4" = "move container to workspace ${ws4}";
      "${mod}+Shift+5" = "move container to workspace ${ws5}";

      "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute 0 toggle";
      "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume 0 -5%";
      "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume 0 +5%";
      "XF86MonBrightnessDown" = "exec light -U 30";
      "XF86MonBrightnessUp" = "exec light -A 30";
    };
  };
}
