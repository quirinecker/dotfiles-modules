{ self, ... }:
{
  flake.modules.nixos.desktop = { ... }: {
    imports = [
      self.modules.nixos.hyprland
    ];
  };
  flake.modules.homeManager.desktop = { ... }: {
    imports = [
      self.modules.homeManager.hyprland
      self.modules.homeManager.noctalia
      self.modules.homeManager.desktop-theme
      self.modules.homeManager.default-apps
    ];
  };
}
