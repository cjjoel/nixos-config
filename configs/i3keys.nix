{ pkgs, lib, ... }:

let 
mod="Mod4";
ws1 = "1:Term";
ws2 = "2:Firefox";
ws3 = "3:Doom";
ws4 = "4:Matrix";
ws5 = "5:Class";
ws6 = "6:";
ws7 = "7";
ws8 = "8";
ws9 = "9";
in { 

            xsession.windowManager.i3.config.keybindings = lib.mkOptionDefault {
                "${mod}+Return" = "exec ${pkgs.termite}/bin/termite";
                "${mod}+Shift+q" = "kill";
                "${mod}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
                # "${mod}+d" = "exec ${pkgs.bash}/bin/bash ~/.config/i3/rofi-wrapper";

                "${mod}+j" = "focus left";
                "${mod}+k" = "focus right";
                "${mod}+Left" = "focus left";
                "${mod}+Down" = "focus down";
                "${mod}+Up" = "focus up";
                "${mod}+Right" = "focus right";

                "${mod}+Shift+j" = "move left";
                "${mod}+Shift+k" = "move right";
                "${mod}+Shift+Left" = "move left";
                "${mod}+Shift+Right" = "move right";
                "${mod}+Shift+Down" = "move down";
                "${mod}+Shift+Up" = "move up";

                "${mod}+h" = "split h";
                "${mod}+v" = "split v";
                "${mod}+f" = "fullscreen toggle";

                "${mod}+s" = "layout stacking";
                "${mod}+w" = "layout tabbed";
                "${mod}+e" = "layout toggle split";

                "${mod}+Shift+space" = "floating toggle";
                "${mod}+space" = "focus mode_toggle";

                "${mod}+1" = "workspace ${ws1}";
                "${mod}+2" = "workspace ${ws2}";
                "${mod}+3" = "workspace ${ws3}";
                "${mod}+4" = "workspace ${ws4}";
                "${mod}+5" = "workspace ${ws5}";
                "${mod}+6" = "workspace ${ws6}";
                "${mod}+7" = "workspace ${ws7}";
                "${mod}+8" = "workspace ${ws8}";
                "${mod}+9" = "workspace ${ws9}";

                "${mod}+Shift+1" = "move container to workspace ${ws1}";
                "${mod}+Shift+2" = "move container to workspace ${ws2}";
                "${mod}+Shift+3" = "move container to workspace ${ws3}";
                "${mod}+Shift+4" = "move container to workspace ${ws4}";
                "${mod}+Shift+5" = "move container to workspace ${ws5}";
                "${mod}+Shift+6" = "move container to workspace ${ws6}";
                "${mod}+Shift+7" = "move container to workspace ${ws7}";
                "${mod}+Shift+8" = "move container to workspace ${ws8}";
                "${mod}+Shift+9" = "move container to workspace ${ws9}";

                "${mod}+Shift+c" = "reload";
                "${mod}+Shift+r" = "restart";
                "${mod}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'"; 
                "${mod}+r" = "mode resize";

                "XF86AudioMute" = "exec pactl set-sink-mute 0 toggle";
                "XF86AudioLowerVolume" = "exec pactl set-sink-volume 0 -5%";
                "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 0 +5%";
                "XF86MonBrightnessDown" = "exec light -U 30";
                "XF86MonBrightnessUp" = "exec light -A 30";
            };
}
