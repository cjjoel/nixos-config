{ pkgs, ... }:


let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; }; in {
  imports = [ 
    ./common.nix
  ];

  users.users.joel = {
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "video"];
  };

}
