{
  nixpkgs.overlays = import ../overlays;
  hardware.cpu.intel.updateMicrocode = true;
}
