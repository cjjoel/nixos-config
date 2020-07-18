{ package, enable, lib}:

with lib;
mkMerge [
  (mkIf enable
    (attrsets.setAttrByPath ["my" "home" "programs" (getName package) "enable" ] true))
  (mkIf (!enable)
    (attrsets.setAttrByPath ["my" "packages" ] [ package ]))
]
