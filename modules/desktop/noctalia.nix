{ ... }: {
  flake.modules.nixos.noctalia = { ... }: {
    services.upower.enable = true;
  };

  flake.modules.homeManager.noctalia = { lib, config, ... }: {
    options = {
      modules.noctalia.smallScreen = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether to adjust to small screen. Affects mostly the visibility of the middle bar panel.";
      };
    };

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
