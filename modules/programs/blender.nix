{ ... }:
{
  flake.modules.homeManager.blender = {pkgs, ...}: {
    home.packages = [
      (pkgs.blender.override {
        config.cudaSupport = true;
        config.rocmSupport = false;
      })
    ];
  };
}
