{ self, ... }:
{
  flake.modules.nixos.ai = {
    imports = [
      self.modules.nixos.ollama
      # self.modules.nixos.open-webui
    ];
  };
}
