{ package, pkgs, lib, config, ...}:

with lib;
{
 my = mkMerge [
     (mkIf (lib.attrsets.hasAttrByPath["my" "home" "programs" (strings.getName package)] config.my)
      (attrsets.setAttrByPath ["home" "program" (strings.getName package) "enable" ] true))

     (mkIf (!lib.attrsets.hasAttrByPath["my" "home" "programs" (strings.getName package)] config.my)
      (attrsets.setAttrByPath ["packages" ] [ package ]))
];
}
