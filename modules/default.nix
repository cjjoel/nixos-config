{ config, options, lib, ... }:

with lib; with types;
let
  mkOptionStr = value:
    mkOption {
      type = str;
      default = value;
    };

  getDir = dir: mapAttrs (file: type: 
    if type == "directory" then 
        getDir "${dir}/${file}" 
      else type) 
    (builtins.readDir dir);

  files = dir: collect isString 
    (mapAttrsRecursive (path: type: concatStringsSep "/" path) (getDir dir));

  validFiles = dir: map (file: ./. + "/${file}") 
    (filter (file: 
                hasSuffix ".nix" file && 
                file != "default.nix" && 
                file != "skeleton.nix") 
            (files dir));
in {
  imports = [ <home-manager/nixos> ] ++ validFiles ./.;

	options = {
		my = {
      username = mkOptionStr "joel";
     	home = mkOption { type = options.home-manager.users.type.functor.wrapped; };
     	user = mkOption { type = submodule; };
     	packages = mkOption { type = listOf package; };
		};
    modules.enableList = mkOption { type = listOf str; default = []; };
    modules.pkgList = mkOption { type = listOf package; default = []; };
	};

	config = {
    home-manager.users.${config.my.username} = mkAliasDefinitions options.my.home;
    users.users.${config.my.username} = mkAliasDefinitions options.my.user;
    my.user.packages = config.my.packages;

    my.home.programs =  (attrsets.genAttrs config.modules.enableList (name: attrsets.setAttrByPath ["enable" ] true));
    my.packages =  config.modules.pkgList;
	};
}
