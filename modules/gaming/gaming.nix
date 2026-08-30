{ self, ... }:
{
  flake.modules.nixos.gaming = { ... }: {
    imports = [
      self.modules.nixos.cemu
      self.modules.nixos.steam
    ];
  };
}
