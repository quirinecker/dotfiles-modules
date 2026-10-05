{ ... }:
{
  # This module adds required software to control the lighting of my tower pc
  flake.modules.nixos.hardware.lighting = { ... }: {
    programs.coolercontrol.enable = true;
    services.hardware.openrgb.enable = true;
  };
}
