{ lib, config }: category: type: { package, mod ? (lib.getName package), conf ? {} }:

with lib; type {
  inherit package lib conf;
  cond = (attrsets.attrByPath [ "modules" category mod "enable" ] false config); }
