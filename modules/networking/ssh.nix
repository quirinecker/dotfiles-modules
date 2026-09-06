{ ... }:
{
  flake.modules.networking.ssh = {
    services.sshd.enable = true;
  };
}
