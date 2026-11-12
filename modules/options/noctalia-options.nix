{ ... }:
{
  flake.modules.homeManager.noctalia-options = { lib, ... }: {
    options = {
      modules.noctalia.smallScreen = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether to adjust to small screen. Affects mostly the visibility of the middle bar panel.";
      };
    };
  };
}
