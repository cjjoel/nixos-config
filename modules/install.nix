{ package, pkgs, lib}:

{

  my = 
    (if lib.attrsets.hasAttrByPath[ "home" "programs" package ] then
      (home.program.package = lib.attrsets.setAttrByPath [ "enable" ] true)
    else
      (packages = with pkgs; [ package ]));
}
