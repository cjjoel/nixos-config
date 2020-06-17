#{pkgs, lib, ... }:

#let 
#mod="Mod4";
#ws1 = "1:Term";
#ws2 = "2:Firefox";
#ws3 = "3:Doom";
#ws4 = "4:Matrix";
#ws5 = "5:Class";
#ws6 = "6:";
#ws7 = "7";
#ws8 = "8";
#ws9 = "9";
#in {
{
  	imports = [./i3keys.nix ];
	xsession.windowManager.i3 = {
        enable = true;
        config = {
		# imports = [ ./i3keys.nix ];
            fonts=["Ubuntu Mono 14"];
            bars = [{
                fonts = ["Ubuntu Mono 14"];
            }];

        };
    };
}
