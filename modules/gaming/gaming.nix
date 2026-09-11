{ self, ... }:
{
  flake.modules.nixos.gaming = { ... }: {
    imports = [
      self.modules.nixos.cemu
      self.modules.nixos.eden
      self.modules.nixos.steam
      self.modules.nixos.xbox-controller
      self.modules.nixos.gpu-screenrecorder
    ];
  };
}
