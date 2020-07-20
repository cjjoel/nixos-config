{ package, conf ? {}, cond, lib }:

with lib; 
mkIf cond (mkMerge [
  (attrsets.setAttrByPath ["my" "home" "programs" package "enable" ] true)
  (attrsets.setAttrByPath ["my" "home" "programs" package ] conf) ])
