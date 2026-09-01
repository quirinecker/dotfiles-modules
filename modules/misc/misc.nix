{ self, ... }:
{
  flake.modules.nixos.misc = { ... }: {
    imports = [
      self.modules.nixos.flake
      self.modules.nixos.keyd
      self.modules.nixos.stateversion
    ];
  };
}
