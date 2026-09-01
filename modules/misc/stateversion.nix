{ ... }: {
  flake.modules.nixos.stateversion = {
    system.stateVersion = "24.05";
  };
  flake.modules.homeManager.stateversion = {
    home.stateVersion = "26.05";
  };
}
