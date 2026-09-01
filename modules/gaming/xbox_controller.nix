{ ... }: {
  flake.modules.nixos.xbox-controller = {
    hardware.xone.enable = true;
  };
}
