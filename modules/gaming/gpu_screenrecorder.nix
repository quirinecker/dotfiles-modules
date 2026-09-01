{ ... }: {
  flake.modules.nixos.gpu-screenrecorder = { pkgs, ... }: {
    programs.gpu-screen-recorder.enable = true;
    environment.systemPackages = with pkgs; [
      gpu-screen-recorder
      killall
      libnotify
    ];
  };
}
