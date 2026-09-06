{ ... }:
{
  flake.modules.wake_on_lan = { ... }: {
    networking.interfaces.enp5s0.wakeOnLan.enable = true;
  };
}
