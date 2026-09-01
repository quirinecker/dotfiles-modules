{ self, ... }:
{
  flake.modules.nixos.desktop = { ... }: {
    imports = [
      self.modules.nixos.hyprland
      self.modules.nixos.noctalia-greeter
      self.modules.nixos.xserver
      self.modules.nixos.gnome-services
      self.modules.nixos.wayland
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
