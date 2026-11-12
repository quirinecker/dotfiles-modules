{ ... }: {
  flake.modules.nixos.noctalia = { ... }: {
    services.upower.enable = true;
  };

  flake.modules.homeManager.noctalia = { config, ... }: {
    config = {
      programs.noctalia = {
        enable = true;
        settings = (import ./noctalia/_settings.nix) {
          smallScreen = config.modules.noctalia.smallScreen;
        };
      };
    };
  };
}
