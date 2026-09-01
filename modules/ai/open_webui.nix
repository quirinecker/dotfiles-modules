{ ... }: {
  flake.modules.nixos.open-webui = {
    services.open-webui.enable = true;
    services.open-webui.port = 7070;
  };
}
