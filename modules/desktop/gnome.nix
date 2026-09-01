{ ... }: {
  flake.modules.nixos.gnome = {
    services.desktopManager.gnome.enable = false;
    services.gnome.core-apps.enable = false;
  };
}
