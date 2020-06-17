{ config, options, lib, ... }:
with lib;

let
  mkOptionStr = value:
    mkOption {
      type = types.str;
      default = value;
    };
in {
	imports = [
    <home-manager/nixos>
    ./desktop/window-manager
    ./desktop/display-manager
    ./browser
		./misc
    ./editor
    ./terminal
    ./shell
    ./utils
    ./social
	];

	options = {
		my = {
      username = mkOptionStr "joel";
     	home = mkOption { type = options.home-manager.users.type.functor.wrapped; };
     	user = mkOption { type = types.submodule; };
     	packages = mkOption { type = with types; listOf package; };
		};
	};

	config = {
    home-manager.users.${config.my.username} = mkAliasDefinitions options.my.home;
    users.users.${config.my.username} = mkAliasDefinitions options.my.user;
    my.user.packages = config.my.packages;
	};
}
