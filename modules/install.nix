{ package, cond, lib, ... }:

with lib;
mkIf cond (attrsets.setAttrByPath ["my" "packages" ] [ package ])
