{ ... }: {
  flake.modules.nixos.plymouth = { ... }: {
    boot = {
      plymouth = {
        enable = true;
        theme = "bgrt";
      };

      # Enable "Silent boot"
      consoleLogLevel = 3;
      kernelParams = [
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
        "plymouth.use-simpledrm"
      ];
    };
  };
}
