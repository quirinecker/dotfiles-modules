{ self, ... }: {
  flake.modules.nixos.virtualisation = {
    imports = [
      self.modules.nixos.docker
      self.modules.nixos.virtmanager
    ];
  };
}
