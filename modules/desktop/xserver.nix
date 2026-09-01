{ ... }: {
  flake.modules.nixos.xserver = { pkgs, ... }: {

    services.xserver.enable = true;

    services.xserver.excludePackages = with pkgs; [
      xterm
    ];

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

  };
}
