{ self, ... }:
{
  flake.modules.nixos.networking = { pkgs, ... }: {

    imports = [
      self.modules.nixos.mullvad
    ];

    networking.networkmanager.enable = true;

    environment.variables = {
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };

  };
}
