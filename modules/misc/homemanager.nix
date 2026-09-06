{ inputs, ... }:
{
  flake.modules.nixos.homemanager = {
    imports = [
      inputs.home-manager.nixosModules.default
    ];

    home-manager.useUserPackages = true;
    home-manager.useGlobalPkgs = true;
  };
}
