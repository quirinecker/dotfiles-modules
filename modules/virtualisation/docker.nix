{ ... }: {
  flake.modules.nixos.docker = { pkgs, ... }: {
    virtualisation.docker.enable = true;
    virtualisation.docker.rootless.setSocketVariable = true;
    virtualisation.docker.rootless.enable = true;
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
