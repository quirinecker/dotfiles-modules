{ ... }:
{
  flake.modules.nixos.power-button = {
    services.logind.settings.Login.HandlePowerKey = "ignore";
  };
}
