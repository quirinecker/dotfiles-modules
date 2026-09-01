{ self, ... }: {
  flake.modules.nixos.system = {
    imports = [
      self.modules.nixos.boot
      self.modules.nixos.locale
    ];
  };
}
