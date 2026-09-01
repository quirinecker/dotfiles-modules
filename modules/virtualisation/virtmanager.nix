{ ... }: {
  flake.modules.nixos.virtmanager = {
    programs.virt-manager.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
    virtualisation.libvirtd.enable = true;
  };
}
