{ ... }: {
  flake.modules.nixos.flake = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
