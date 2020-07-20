{ lib, config }: category: type: { package, conf ? {} }:

with lib; type {
  inherit package lib conf;
  cond = (attrsets.attrByPath [ "modules" category (getName package) "enable" ] false config); }
