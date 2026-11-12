{ self, ... }:
{
  flake.modules.homeManager.options = {
    imports = with self.modules.homeManager; [
      hyprland-options
      noctalia-options
    ];
  };
}
