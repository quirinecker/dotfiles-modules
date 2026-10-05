{ ... }:
{
  # This module adds required software to control the lighting of my tower pc
  flake.modules.nixos.lighting = { ... }: {
    programs.coolercontrol.enable = true;
    services.hardware.openrgb.enable = true;
  };
}
